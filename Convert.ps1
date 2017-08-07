$StyleName = Show-Input "Please provide new style name:"

$LowerStyleName = $StyleName.ToLower();

Read-Variable -Parameters @{ Name = "l"; Path ="p"; Title = "Pick Item"; Source="/sitecore/content/Showcase/int/Presentation/Styles"; editor="droptree"; }

$NewItem = New-Item $l.Paths.Path -ItemType "/sitecore/templates/Foundation/Experience Accelerator/Presentation/Style" -Name $StyleName

$NewItem.Editing.BeginEdit();

$NewItem.Fields["Value"].Value = $LowerStyleName.Replace(“ “, ”-”);

$NewItem.Editing.EndEdit();