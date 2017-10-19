$styles = Get-ChildItem -Path "/sitecore/content/Showcase/int/Presentation/Styles"

foreach ($text in $styles) 
{
    $textHash= '"' + $text +'"'
    write-host 'New-Item $Source.Paths.Path -ItemType "/sitecore/templates/Foundation/Experience Accelerator/Presentation/Styles"' -Name $textHash
    $text.Editing.BeginEdit()
    $text.Fields["Value"].Value = "test"
    $text.Editing.EndEdit()
}

if($result -ne "ok")
{
    Exit
}

