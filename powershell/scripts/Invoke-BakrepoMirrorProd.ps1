[CmdletBinding(SupportsShouldProcess=$true)]
Param(
    [Parameter()]
        [string] $BucketName = 'dataops-ev-sql-db-backups-01',
    [Parameter()]
        [string] $KeyPrefix = (Get-Date -f 'yyyy/MM'),
    [Parameter()]
        [string] $DestinationBucketName = 'dataops-ev-sql-db-backups-testing-01',
    [Parameter()]
        [string] $DestinationKeyPrefix,
    [Parameter()]
        [string] $ReaderProfileName = 'DataopsBackupReaderProd',
    [Parameter()]
        [string] $WriterProfileName = 'DataopsBackupWriterProd'
)
Set-StrictMode -Version Latest

# Not bullet-proof, but might prevent a fat-finger catastrophe
$productionBuckets = @(
    'dataops-ev-sql-db-backups-01'
)

if ($productionBuckets.Contains($DestinationBucketName)) {
    throw "you can't mirror to production"
}

# Remove existing objects
# $keyCollection = Get-S3Object -BucketName $DestinationBucketName -KeyPrefix $DestinationKeyPrefix -ProfileName $ReaderProfileName | Select-Object -ExpandProperty Key
# Remove-S3Object -BucketName $DestinationBucketName -KeyCollection $keyCollection -ProfileName $WriterProfileName -Force

Get-S3Object -BucketName $BucketName -KeyPrefix $KeyPrefix -ProfileName $ReaderProfileName |
    % {
        $metadata = $_ | Get-S3ObjectMetadata -ProfileName $ReaderProfileName
        $evMetadata = $metadata.Metadata['x-amz-meta-ev-context']
        $tagSet = $_ | Get-S3ObjectTagSet -ProfileName $ReaderProfileName

        $destinationS3ObjectParams = @{
            BucketName = $DestinationBucketName 
            Key = (($DestinationKeyPrefix, $_.Key -ne '') -join '/')
            ProfileName = $WriterProfileName
        }

        $writeS3ObjectParams = $destinationS3ObjectParams.Clone()
        if ($evMetadata) {
            $writeS3ObjectParams['Metadata'] = @{'ev-context' = $evMetadata}
        }

        $target = (($DestinationBucketName, $DestinationKeyPrefix -ne '') -join '/')
        Write-Verbose "Cloning ${BucketName}/$($_.Key) to ${target}"
        Write-S3Object @writeS3ObjectParams -Content "."

        if ($tagSet) {
            Write-S3ObjectTagSet @destinationS3ObjectParams -Tagging_TagSet $tagSet
        }
    }