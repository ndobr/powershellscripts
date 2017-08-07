$StyleName = Show-Input "Please provide new style name:"
$LowerStyleName = $StyleName.ToLower()
$Source = (Get-Item .).Paths.Path
$NewItem = New-Item $Source -ItemType "/sitecore/templates/Foundation/Experience Accelerator/Presentation/Style" -Name $StyleName
$NewItem = New-Item $l.Paths.Path -ItemType "/sitecore/templates/Foundation/Experience Accelerator/Presentation/Style" -Name $StyleName
$NewItem.Editing.BeginEdit()
$NewItem.Fields["Value"].Value = $LowerStyleName
$NewItem.Fields["Value"].Value = $NewItem.Fields["Value"].Value.Replace(“ “,”-”)
$NewItem.Editing.EndEdit()