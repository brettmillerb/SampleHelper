function Update-DLMember {
    [CmdletBinding()]
    Param (
        [LocationSet]$site
    )

    begin {
        $object = Import-PowerShellDataFile -Path $PSScriptRoot\sample.psd1
    }

    process {
        $users = Get-ADUser -Filter { enabled -eq $true } mail -SearchBase $object.$site.OU | Select-Object -ExpandProperty mail

        Update-DistributionGroupMember -Identity $object.$site.DL -Member $users -confirm:$false
    }
}