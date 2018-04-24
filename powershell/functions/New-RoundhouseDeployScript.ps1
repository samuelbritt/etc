function New-RoundhouseDeployScript
{
    [CmdletBinding()]
    param(
        [Parameter(Position=1,Mandatory=$true,ValueFromPipeline=$true)]
            [string] $BranchName,
            [Parameter()]
            [string] $SourceBranchName = "master",
        [Parameter()]
            [switch] $Local,
        [Parameter()]
            [string] $DeployDir = "${env:HOME}\roundhouse-deployments",
        [Parameter()]
            [string] $Path = "C:\Source\Production\Roundhouse",
        [Parameter()]
            [switch] $PassThru
    )
    Begin
    {
        Push-Location $Path
        if ( !((Test-GitRepository) -and ((Get-Location).Path -match 'roundhouse')) )
        {
            Write-Error "$(Get-Location) is not a roundhouse repository."
            break
        }

        Write-Verbose "fetching latest branches..." -Verbose
        git fetch
    }
    Process
    {

        $diffSource = "origin/$SourceBranchName"
        $diffTarget = "origin/$BranchName"

        if ($Local)
        {
            $diffTarget = $BranchName
        }

        $deployScript = Join-Path $DeployDir "${diffTarget}__${SourceBranchName}-$(Get-Date -f yyyMMddTHHmmss).sql"

        if (! (git branch --list --all $diffTarget --no-merged $diffSource))
        {
            # The branch might have been merged and deleted. Try to find the merge commit:
            $merge_commit = git log --grep "Merge pull.*$BranchName.*to master" --format='%H' --merges
            if ($merge_commit)
            {
                $diffSource = "${merge_commit}^"
                $diffTarget = "$merge_commit"
                Write-Warning "Branch $BranchName has been merged. Determining files from merge commit"
            }
            else
            {
                Write-Error "Could not find branch $diffTarget. It either does not exist, or has already been merged."
                break
            }
        }

        $fileSort = {
            if ( $_ -like '*OneTime*' )          { 1 }
            if ( $_ -like '*Views*' )            { 2 }
            if ( $_ -like '*Functions*' )        { 3 }
            if ( $_ -like '*StoredProcedures*' ) { 4 }
            if ( $_ -like '*Manual*' )           { 5 }
        }

        Write-Verbose "exporting to file ${deployScript}..." -Verbose
        $deployScriptItem = New-Item -Path $deployScript -ItemType File -Force
        Add-Content -Path $deployScript -Value "USE [<database,,evestment_tub>]"
        Add-Content -Path $deployScript -Value "GO`r`n"
        Add-Content -Path $deployScript -Value "DECLARE @ServerName sysname = @@servername`r`n"
        Add-Content -Path $deployScript -Value "RAISERROR('deploying branch %s on server %s...', 10, -1, '${BranchName}', @ServerName) WITH NOWAIT"

        $files = Invoke-Expression "git diff --name-only $diffSource...$diffTarget"
        $files |
            Where-Object { $_ -match '.*\.sql$' } |
            Sort-Object -Property @{ e=$fileSort }, { $_ } |
            ForEach-Object {
                $path = $_
                Write-Verbose "exporting file ${path}..." -Verbose
                Add-Content -Path $deployScript -Value "--#region $_"
                Add-Content -Path $deployScript -Value "RAISERROR('deploying %s...', 10, -1, '${path}') WITH NOWAIT"
                Add-Content -Path $deployScript -Value "GO`r`n"
                $content = git show "${diffTarget}:$path"
                Add-Content -Path $deployScript -Value $content
                Add-Content -Path $deployScript -Value "GO"
                Add-Content -Path $deployScript -Value "--#endregion`r`n"
            }
        Add-Content -Path $deployScript -Value "RAISERROR('done.', 10, -1) WITH NOWAIT"


        Write-Verbose "done." -Verbose
        Invoke-Item $deployScript

        if ($PassThru)
        {
            Write-Output $deployScriptItem
        }
    }
    End
    {
        Pop-Location
    }
}
