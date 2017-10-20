$rootItem = Get-Item -Path "/sitecore/media library/Project/CognifideCom/blogs"
$sourceTemplate = Get-Item -Path "/sitecore/templates/System/Node"
$targetTemplate = Get-Item -Path "/sitecore/templates/System/Media/Media folder"
 
Get-ChildItem $rootItem.FullPath -Recurse | Where-Object { $_.TemplateName -eq $sourceTemplate.Name } | ForEach-Object {  
    Set-ItemTemplate -Item $_ -TemplateItem $targetTemplate
}