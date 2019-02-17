function New-GitCommit
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