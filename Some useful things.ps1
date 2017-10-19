$template = "StyleTemplate"
$pages = Get-ChildItem -Path "/sitecore/content/Cognifide2015/int/Home" -Recurse
$styles = Get-ChildItem -Path "/sitecore/content/Cognifide2015/int/Presentation/Styles" -Recurse | Where-Object { $_.TemplateName -eq $template }

$prestyles = @()
$styles |% { $prestyles += $_.Id }

$stylesz = @()

foreach ($page in $pages) { 
    $renderings =  $page["__Renderings"]

    foreach ($style in $styles) {
        if ($renderings.Contains($style.ID)) {
            $stylesz += $style.ID
        }
    }
}

$prestyles |? { $stylesz -notcontains $_ } |% { gi . -ID $_.Guid }