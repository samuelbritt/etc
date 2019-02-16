function Invoke-BakrepoAdhocUpload
{
    [CmdletBinding(SupportsShouldProcess = $true)]

    Param(
        $Path,
        [datetime]$BackupFinishDate = (Get-Date '2017-07-02 20:00:01.000'),
        $BackupSetId      = 769139,
        $Project          = 'Platform',
        $Contact          = 'DataOps',
        $ServerInstance   = 'EVEST-PDB-01',
        $Database         = 'DocumentRepository',
        $FileNamePattern  = 'DocumentRepository_(\d).7z',
        $BackupType       = 'FULL',
        $IsCopyOnly       = $False,
        $EncryptorType    = '7-ZIP',
        $Extension        = '.bak.7z',
        $BucketName       = 'dataops-bakrepo',
        $ProfileName      = 'DataopsBackupWriterSandbox'
    )

    Get-ChildItem "${Path}/*.7z" |
        Select-Object FullName, @{n='Seq'; e={ $_.Name -match $Pattern | Out-Null; [int]($Matches[1]) }} |
        % {
            New-Object PSObject -Property @{
                Project          = $Project
                Contact          = $Contact
                BackupFinishDate = $BackupFinishDate
                BackupSetId      = $BackupSetId
                BackupType       = $BackupType
                ServerInstance   = $ServerInstance
                Database         = $Database
                EncryptorType    = $EncryptorType
                Extension        = $Extension
                IsCopyOnly       = $IsCopyOnly
                Path             = $_.FullName
                SequenceNumber   = $_.Seq
                KeyTemplate      = '${BACKUP_YEAR}/${BACKUP_MONTH}/${INSTANCE}/${DATABASE}/${BACKUP_TYPE}/${DATABASE}_${SEQUENCE}${FILE_EXTENSION}'
                Key = "$($BackupFinishDate.ToString('yyyy'))/$($BackupFinishDate.ToString('MM'))/$($ServerInstance.ToLower())/$($Database.ToLower())/$($BackupType.ToUpper())/$($ServerInstance.ToLower())_$($Database.ToLower())_$($BackupType.ToUpper())_$($BackupFinishDate.ToString('yyyyMMdd_HHmmss'))_$($_.Seq.ToString('00'))${Extension}"
            }
        } | Write-EvObject -Application bakrepo -BucketName $BucketName -ProfileName $ProfileName -Tag @{ Contact = $Contact} -Whatif:$WhatIfPreference -Verbose:$VerbosePreference
}
