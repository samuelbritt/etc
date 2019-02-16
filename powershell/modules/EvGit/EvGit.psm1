# Implement your module commands in this script.

function Test-GitRepository
{
    $err = $false
    try
    {
        Invoke-Expression "&git root" -ErrorVariable err 2>&1 | Out-Null
    }
    catch
    {
        $err = $True
    }
    
    Write-Output (-not ([bool]$err))
}

function New-Branch
{
    param(
        [Parameter()]
        [int] $Case,
        [Parameter(Mandatory = $True)]
        [string] $Name
    )
    $branchName = ""
    if ($Case)
    {
        $branchName = "FB${Case}_"
    }
    $branchName = "${branchName}SEB_${Name}"
    git checkout -b $branchName
}

function Get-BranchDetails
{
    param(
        $BranchName = (Get-CurrentBranch)
    )
    $issue = Get-Issue -BranchName $BranchName

    $summary = $null
    if ($BranchName -ne "master")
    {
        if ($issue)
        {
            $summary = $BranchName.Replace("${issue}-", "")
        }
        $summary = $summary.Replace("${env:USERINITIALS}_", "").Replace("${env:USERINITIALS}-", "").Replace("-", " ")
    }

    $branchDetails = New-Object PSObject -Property @{
        Branch = $BranchName
        Issue = $issue
        Summary = $summary
    }
    Write-Output $branchDetails
}

function Get-CurrentBranch
{
    git rev-parse --abbrev-ref HEAD
}

function Get-Branch
{
    param ([string] $Issue, [switch] $All)
    $branches = git branch

    if ($All)
    {
        $branches = git branch -a
    }

    $branches = $branches | Select-String "${Issue}-"
    if ($branches)
    {
        $branches | ForEach-Object { $_.ToString().Trim(' *').Replace('remotes/', '') }
    }
}

function Open-Branch
{
    param ([string] $Issue)
    Set-StrictMode -Version Latest

    $branches = @(Get-Branch -Issue $Issue -All |
            Where-Object { $_ } |
            ForEach-Object { $_ -replace '^origin/' } |
            Select-Object -Unique)

    if (-not $branches)
    {
        Write-Error "Could not find branch for issue $Issue."
        return
    }

    if ($branches.Count -gt 1)
    {
        $msg = "Found more than one branch for issue ${Issue}:`n"
        $msg += ($branches | Out-String)
        Write-Error $msg
        return
    }

    $branchToCheckout = $branches[0]
    if ($branchToCheckout -ne (Get-CurrentBranch))
    {
        git checkout $branchToCheckout
    }
}
Set-Alias -Name co -Value Open-Branch

function Get-Issue
{
    param(
        $BranchName = (Get-CurrentBranch)
    )
    if ($BranchName -match '^(.*?-\d*)\s*-')
    {
        Write-Output $Matches[1]
    }
}

function New-Commit
{
    [CmdletBinding(SupportsShouldProcess = $true)]
    param(
        [Parameter(Position = 1)]
        [string]$Message,
        [Parameter()]
        [switch] $AddFiles,
        [Parameter()]
        [string]$Issue
    )

    $details = Get-BranchDetails

    if (-not $Issue)
    {
        $Issue = $details.Issue
    }

    if (-not $Message)
    {
        $Message = $details.Summary
    }

    $commitMessage = "$Issue - $Message"
    if ($PSCmdlet.ShouldProcess($commitMessage, "git commit"))
    {
        if ($AddFiles)
        {
            git commit -am $commitMessage
        }
        else
        {
            git commit -m $commitMessage
        }
    }
}

# Export only the functions using PowerShell standard verb-noun naming.
# Be sure to list each exported functions in the FunctionsToExport field of the module manifest file.
# This improves performance of command discovery in PowerShell.
Export-ModuleMember -Function *-* -Alias *