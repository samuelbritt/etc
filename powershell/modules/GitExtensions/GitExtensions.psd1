@{
    RootModule = "GitExtensions.psm1"
    ModuleVersion = '0.0.0.0'
    GUID = "b3013027-c1d7-4b33-874c-bc4b60e62ba2"
    RequiredModules = @(
        'Git'
    )
    FunctionsToExport = @(
        "New-GitCommit"
        "Open-GitBranch"
        "Get-GitBranch"
    )
}
