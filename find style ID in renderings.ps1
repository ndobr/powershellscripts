$template = "Style"
$styleid = "{6DE536E2-2994-4913-9F7E-A0685CE3A4C8}"
$styles = @(Get-ChildItem -Path "/sitecore/content/Showcase/int/Presentation/Styles" -Recurse | Where-Object { $_.TemplateName -eq $template } )
foreach ($item in $styles) {
    if ($item.ID -eq $styleid) {
    write-host $item.Name
}
}
