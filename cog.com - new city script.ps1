$CityName = Show-Input "Please provide new city name"
$street = Show-Input "Please provide street name"

$url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + $CityName + $street
$json = Invoke-WebRequest $url | ConvertFrom-JSON
$json.results.geometry.location.lat
$json.results.geometry.location.lng

$PoiFolderPath = get-item -Path "/sitecore/content/CognifideCom/int/Data/POIs"
$PoiTemplatePath = get-item -Path "/sitecore/templates/Foundation/Experience Accelerator/Geospatial/POI"

$NewPoiItem = New-Item -Path "/sitecore/content/CognifideCom/int/Data/POIs" -ItemType "/sitecore/templates/Foundation/Experience Accelerator/Geospatial/POI" -Name $CityName

$NewPoiItem.Editing.BeginEdit()
$NewPoiItem["Title"] = $CityName
$NewPoiItem.Editing.EndEdit()

$NewCityPage = New-Item -Path "/sitecore/content/CognifideCom/int/Home/join-us" -ItemType "/sitecore/templates/Project/CognifideCom/Jobs/Office" -Name $CityName

$NewCityPage.Editing.BeginEdit()
$NewCityPage["Title"] = $CityName
$NewCityPage.Editing.EndEdit()

$OurOffices = get-item -Path "/sitecore/content/CognifideCom/int/Data/Promos/Our offices"
$OurOffices.Editing.BeginEdit()
$OurOffices["PromoText"] = $OurOffices["PromoText"] + '<a href="~/link.aspx?_id=' + $NewCityPage.ID + '&amp;_z=z">' + $CityName + '</a>'
$OurOffices.Editing.EndEdit()

$NewCityMap = New-Item -Path "/sitecore/content/CognifideCom/int/Data/Maps" -ItemType "/sitecore/templates/Feature/Experience Accelerator/Maps/Map" -Name $CityName

$NewCityMap.Editing.BeginEdit()
$NewCityMap["CentralPointMode"] = '{4D3501A6-E34B-4E19-B6B2-BDA2CFDA2C8A}'
$NewCityMap["POI"] = $NewPoiItem.ID
$NewCityMap["Width"] = '1200'
$NewCityMap["Height"] = '300'
$NewCityMap["CentralPointLatidiute"] = $json.results.geometry.location.lat
$NewCityMap["CentralPointLongitude"] = $json.results.geometry.location.lng
$NewCityMap.Editing.EndEdit()
