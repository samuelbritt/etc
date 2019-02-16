<#
.SYNOPSIS
Opens Jira to the provided issue in your default browser.

.PARAMETER Issue
Issue to open. If not provided, opens to the issue corresponding to your current branch.

.EXAMPLE
Start-Jira ANALYTICS-123

Opens Jira to the page for issue ANALYTICS-123

.EXAMPLE
j ANALYTICS-123

Same as above, but uses the alias "j".

.EXAMPLE
j

Opens Jira to the page for issue corresponding to your current branch, assuming your branch is prefixed with the issue ID.
#>
function Start-Jira
{
    param([string] $Issue = (Get-Issue))
    if (-not $Issue)
    {
        throw "Must provide an issue, or be in a branch."
    }
    Start-Process "https://evestment.atlassian.net/browse/$Issue"
}
Set-Alias j Start-Jira