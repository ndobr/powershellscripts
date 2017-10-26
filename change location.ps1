$sourceTemplate = Get-Item -Path "/sitecore/templates/Project/CognifideCom/Jobs/London Job Post"
$item = Get-item -Path "/sitecore/content/CognifideCom/int/Home/join-us/find-a-role/account-executive" | Where-Object { $_.TemplateName -eq $sourceTemplate.Name } | ForEach-Object {
$_.Editing.BeginEdit()
$_.Fields["Location"].Value = "{BBC99548-BA7E-4873-B0B6-F5924211C0DD}"
$_.Editing.EndEdit()
}
