function New-Note
{
    param(
        [string] $Title = "Untitled",
        [string[]] $Tag = '-'
    )
    Set-StrictMode -Version Latest

    $notesPath = $script:NotesPath
    $now = Get-Date
    $nowForFileName = $now.ToString('yyyy-MM-dd_HHmmss')
    $nowForFileContent = $now.ToString('yyyy-MM-dd hh:mm tt')

    $fileName = "$nowForFileName-${Title}.md"
    $fileName = $fileName.Replace(' ', '-')
    $path = "$notesPath\$fileName"
    if (Test-Path $path)
    {
        throw ($script:Errors.PATH_EXISTS -f $path)
    }

    $content = Get-Content $script:NoteTemplate -Raw
    $content = $content.Replace('${TITLE}', $title)
    $content = $content.Replace('${AUTHOR}', $env:USERNAME)
    $content = $content.Replace('${DATE}', $nowForFileContent)
    $content = $content.Replace('${TAGS}', ($Tag -join ','))

    New-Item $path -ItemType File -Value $content | Open-Note
}

Set-Alias nn New-Note
