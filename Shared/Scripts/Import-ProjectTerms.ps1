# Reference script to initialize the term sets in the managed metadata service application.

$CAProperty = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Shared Tools\Web Server Extensions\14.0\WSS\" -Name CentralAdministrationURL
$centralAdminURL = $CAProperty.CentralAdministrationURL
$taxonomyService = "Managed Metadata Service"

Write-Host @"

Connecting to term store...
"@

$centralAdmin = Get-SPSite $centralAdminURL
$taxonomySession = Get-SPTaxonomySession -Site $centralAdmin
$termStore = $taxonomySession.TermStores[$taxonomyService]

Import-SPTerms -ParentTermStore $termStore -InputFile "C:\\GSoftDynamiteExamplesTerms.xml"

Write-Host @"

Done.
"@