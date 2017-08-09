$StyleName = Show-Input "Please provide new style name:"
$LowerStyleName = $StyleName.ToLower()
$Source = (Get-Item .).Paths.Path
$NewItem = New-Item $Source -ItemType "/sitecore/templates/Foundation/Experience Accelerator/Presentation/Style" -Name $StyleName
$NewItem = New-Item $l.Paths.Path -ItemType "/sitecore/templates/Foundation/Experience Accelerator/Presentation/Style" -Name $StyleName
$NewItem.Editing.BeginEdit()
$NewItem.Fields["Value"].Value = $LowerStyleName
$NewItem.Fields["Value"].Value = $NewItem.Fields["Value"].Value.Replace(“ “,”-”)
Read-Variable -Parameters @{ Name="l"; Title="Pick Rendering"; Source="/sitecore/layout/Renderings/Feature/Experience Accelerator"; Editor="TreelistEx"; }  -Height 620 -Width 600
$NewItem.Editing.EndEdit()
$NewItem.Editing.BeginEdit()
$NewItem.Fields["Allowed Renderings"].Value = $l.ID
$NewItem.Editing.EndEdit()
$dergdace=Show-ModalDialog -Control "ConfirmChoice" -Parameters @{btn_0="Yes"; btn_1="No"; te="Do you want to add another Allowed Rendering?"; cp="Important Questions"} -Height 120 -Width 400
while ($dergdace -eq "btn_0")
{
    Read-Variable -Parameters @{ Name="r"; Title="Pick Item"; Source="/sitecore/layout/Renderings/Feature/Experience Accelerator"; Editor="TreelistEx"; } -Height 620 -Width 600
    $NewItem.Editing.EndEdit()
    $NewItem.Editing.BeginEdit()
    $NewItem.Fields["Allowed Renderings"].Value = $NewItem["Allowed Renderings"] + "|" + $r.ID
    $NewItem.Editing.EndEdit()
    $dergdace=Show-ModalDialog -Control "ConfirmChoice" -Parameters @{btn_0="Yes"; btn_1="No"; te="Do you want to add another Allowed Rendering?"; cp="Important Questions"} -Height 120 -Width 400
}
while  ($dergdace -eq "btn_1")
{
    $Message = "Style has been created"
    Show-Alert $Message
break
}