Import-Csv .\compNameList.csv | ForEach-Object {
    $objComputer = Get-ADComputer "$($_.Name)"

    $Bitlocker_Object = Get-ADObject -Filter {objectclass -eq 'msFVE-RecoveryInformation'} -SearchBase $objComputer.DistinguishedName -Properties 'msFVE-RecoveryPassword'

    $Bitlocker_Object
}

