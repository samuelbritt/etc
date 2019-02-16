function Start-BuildSencha {
    param(
        [Parameter()]
        [ValidateSet('analytics', 'design-lab', 'downloads', 'ext', 'fetch', 'home', 'packages', 'salesforce', 'subscription')]
        [string[]] $Name = 'analytics'
    )

    $Name | ForEach-Object {
        Push-Location "${ANALYTICS}\eA.Analytics.UI\ExtJs\$_";
        sencha repo sync
        sencha app refresh --packages;
        sencha app build --clean;
        Pop-Location
    }
}