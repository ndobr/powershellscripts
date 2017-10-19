$carousel = Get-Item -Path "/sitecore/content/TEST/int/Data/Carousels/Carousel/Slide3"
$promo = Get-Item -Path "/sitecore/content/TEST/int/Home/pdj/Data/Promo3"
$carousel.Editing.BeginEdit()
if ($carousel["__Never publish"] -match "1" )
{
    $promo.Editing.BeginEdit()
    $promo["__Never publish"] = 1
    $promo.Editing.EndEdit()
    
}
$carousel.Editing.EndEdit()