$StyleName = Show-Input "Please provide new style name:"
$LowerStyleName = $StyleName.ToLower()
Write-Host $LowerStyleName
$NewItem = New-Item -Path "/sitecore/content/Showcase/int/Presentation/Styles" -ItemType "/sitecore/templates/Foundation/Experience Accelerator/Presentation/Style" -Name $StyleName
$NewItem.Editing.BeginEdit()
$NewItem.Fields["Value"].Value = $LowerStyleName
$NewItem.Editing.EndEdit()