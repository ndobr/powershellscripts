$item = Get-Item -Path "/sitecore/content/"
$item.Editing.BeginEdit()
$item["__Never publish"] = "1"
$item.Editing.EndEdit()
Publish-Item $item -Target "web" -PublishMode SingleItem
Write-Host "Item has been unpublished"