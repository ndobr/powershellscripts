$media = Get-ChildItem -Path "/sitecore/media library/Project/CognifideCom" -Recurse | Where-Object {$_Fields["Alt"].Value -eq ""} | Foreach-Object {
 $_.Editing.BeginEdit()
 $_.Fields["Alt"].Value = $_.DisplayName
 $_.Editing.EndEdit()
    
}
