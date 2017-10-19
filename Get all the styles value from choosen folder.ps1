$styles = Get-ChildItem -Path "/sitecore/content/Showcase/int/Presentation/Styles"

foreach ($text in $styles.Name) 
{
    $textHash= '"' + $text +'"'
    write-host 'New-Item $Source.Paths.Path -ItemType "/sitecore/templates/Foundation/Experience Accelerator/Presentation/Styles2/buttons"' -Name $textHash -Value "lol"
}

if($result -ne "ok")
{
    Exit
}

