function New-SupsersetBackup
{
    # download
    Copy-BakrepoBackupSet -BucketName dataops-ev-sql-db-backups-01 -Database superset -ServerInstance evest-pdb-01 -BackupType Full  -DestinationDirectory ($pwd) -ProfileName brp
    
    # restore
    $file = 'evest-pdb-01_superset_FULL_20180227_010125_01.bak'
    Copy-Item ($pwd)\$file E:\bakrepo
    Restore-SqlDatabaseBackupSet -ServerInstance localhost -Database 'superset_sbritt' -DirectoryLog "E:\SQLLog\sbritt" -DirectoryData "E:\SQLData\sbritt" -Path E:\bakrepo\$file
    
    # run roundhouse
    $rh = ".\rh.exe"
    $connString = "server=ev-atl-devdata01;database=superset_sbritt;Integrated Security=true"
    $filePath = "C:\Source\Production\Roundhouse\superset"
    $schema = "Roundhouse";
    # $outputFile = ".\RoundhouseLog.xml";
    $version = "1.0"
    &($rh) --up=$filePath\OneTime --functions=$filePath\Functions --views=$filePath\Views --sprocs=$filePath\StoredProcedures --connstring=$connString --env=CI --schema=$schema --version=$version --noninteractive --rcm=NoChange --outputpath=.
}
