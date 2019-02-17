@{
    RootModule = "Tickets.psm1"
    ModuleVersion = '0.0.0.0'
    GUID = "875d09c0-71c3-44d4-9a97-8e850e2a9f00"
    RequiredModules = @(
        'Git'
        'Notes'
    )
    FunctionsToExport = @(
        "Get-TktDir"
        "New-TktDir"
        "New-TktNote"
        "New-TktScratch"
        "Resolve-TktDetails"
        "Set-TktLocation"
    )
}
