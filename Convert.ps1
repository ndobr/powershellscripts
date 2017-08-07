$StyleName = Show-Input "Please provide new style name:"
$LowerStyleName = $StyleName.ToLower()
Write-Host $LowerStyleName
$NewItem = Read-Variable -Parameters @{ Name = "l"; Path ="p"; Title = "Pick Item"; Source="/sitecore/content/Showcase/int/Presentation/Styles"; editor="droptree"; }
Write-Host $l.Paths.Path
$NewItem = New-Item $l.Paths.Path -ItemType "/sitecore/templates/Foundation/Experience Accelerator/Presentation/Style" -Name $StyleName
$NewItem.Editing.BeginEdit()
$NewItem.Fields["Value"].Value = $LowerStyleName
$NewItem.Fields["Value"].Value = $NewItem.Fields["Value"].Value.Replace(“ “,”-”)
$NewItem.Editing.EndEdit()