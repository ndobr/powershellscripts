$styleFolder = Get-Item -Path "/sitecore/content/Showcase/int/Presentation/Styles"

$props = @{
    Parameters = @(
      @{ Name = "StyleName"; Title = "Style Name" },
      @{ Name = "StyleFolder"; Title = "Style Folder"; Root = "/sitecore/content/Showcase/int/Presentation/Styles"; }
    )
    Title = "Powershell Demo"
    OkButtonName = "Ok"
    CancelButtonName = "Abort"
    Width = 600
    Height = 600
}