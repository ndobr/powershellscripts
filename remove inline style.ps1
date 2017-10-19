

$regex = '<img[^>]+(style=".*?")'
$items = Get-ChildItem -Path "/sitecore/content/Rapha Nocturne/Global/home" -Recurse | Where-Object {$_.Content -match $regex } | ForEach-Object {
    Write-Host $_.Paths.Path
    $_.Content = $_.Content.Replace([regex]::Match($_.Content, $regex).Groups.Item(1), '')
}

