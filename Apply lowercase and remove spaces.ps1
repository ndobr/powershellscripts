$Source = Get-ChildItem -Path "/sitecore/content/Showcase/int/Presentation/Styles2/Carousel" -Recurse
foreach ($item in $Source) 
{
    $LowerStyleName = $item.Value.ToLower()
    write-host $item.Value
    $item.Editing.BeginEdit()
    $item.Fields["Value"].Value = $LowerStyleName
    $item.Fields["Value"].Value = $item.Fields["Value"].Value.Replace(“ “,”-”)
    $item.Editing.EndEdit()
    
}