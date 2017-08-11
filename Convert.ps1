$StyleName = Show-Input "Please provide new style name:"
if ($StyleName -eq $null) { Exit }
$Source = (Get-Item .).Paths.Path
$LowerStyleName = $StyleName.ToLower().Replace(“ “,”-”)
$NewItem = New-Item $Source -ItemType "/sitecore/templates/Foundation/Experience Accelerator/Presentation/Style" -Name $StyleName
$NewItem.Editing.BeginEdit()
$NewItem.Fields["Value"].Value = $LowerStyleName
Read-Variable -Parameters @{ Name="l"; Title="Pick Rendering"; Source="/sitecore/layout/Renderings/Feature/Experience Accelerator"; Editor="TreelistEx"; }  -Height 620 -Width 600
$NewItem.Fields["Allowed Renderings"].Value = $l.ID
$NewItem.Fields["Allowed Renderings"].Value = $NewItem.Fields["Allowed Renderings"].Value.Replace(" ","|")
$NewItem.Editing.EndEdit()