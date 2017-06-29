$name = Show-Input "Provide style name"
$NewStyle= New-Item -Path "/sitecore/content/Showcase/int/Presentation/Styles" -ItemType "/sitecore/templates/Foundation/Experience Accelerator/Presentation/Style" -Name $name

$NewStyle.Editing.BeginEdit()
$NewStyle.Fields["__Valuse"].Value = test2
$NewStyle.Editing.EndEdit()