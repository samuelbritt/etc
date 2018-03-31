function Get-JiraIssue
{
    [CmdletBinding()]
    param([string] $Issue)
    Set-StrictMode -Version Latest
    
    function New-JiraTicket
    {
        param(
            [Parameter(ValueFromPipeline = $true)]
            [psobject] $Response
        )
    
        process
        {
            $properties = @{
                Id = $Response.id
                Key = $Response.key
                Url = $Response.self
                Response = $Response
                Summary = $Response.fields.summary
                Type = $Response.fields.issuetype.name
                Status = $Response.fields.status.name
                Project = $Response.fields.project.name
                Assignee = $null
            }
    
            if ($Response.fields.assignee)
            {
                $properties.Assignee = $Response.fields.assignee.name
            }
    
            New-Object psobject -Property $properties
        }
    }
    
    $username = Get-Config jira.username
    $password = Get-Config jira.password
    $baseurl = Get-Config jira.baseurl
    
    if (-not ($username -and $password))
    {
        throw "could not find jira authentication credentials"
    }
    
    if (-not $baseurl)
    {
        throw "could not find jira base url"
    }
    
    $header = Get-BasicAuthHeader -Username $username -Password $password
    $url = "$baseurl/issue/$Issue"
    
    try
    {
        Invoke-RestMethod -Method Get -ContentType application/json -Uri $url -Headers $header |
            New-JiraTicket
    }
    catch
    {
        if (-not (
                (($_ | Get-Member) -contains 'Exception' ) -and
                (($_.Exception | Get-Member) -contains 'Response' ) -and
                (($_.Exception.Response | Get-Member) -contains 'StatusCode' ) -and
                $_.Exception.Response.StatusCode -eq "NotFound"
            ))
        {
        }
        throw $_
    }
}
