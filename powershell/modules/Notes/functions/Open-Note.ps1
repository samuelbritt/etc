function Open-Note
{
    param(
        [Parameter(ValueFromPipelineByPropertyName)]
        [Alias("FullName")]
        $Path = $script:NotesPath
    )
    Set-StrictMode -Version Latest

    $editor = $script:Editor
    &$editor $Path
}

Set-Alias on Open-Note