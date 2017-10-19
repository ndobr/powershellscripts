$items = Get-ChildItem -Path "/sitecore/content/Showcase/int/home/features" -Recurse 
foreach($item in $items) {
    write-host $item["__Renderings"]
}