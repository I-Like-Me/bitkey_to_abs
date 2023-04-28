Import-Csv .\compNameList.csv | ForEach-Object {
    $objComputer = Get-ADComputer "$($_.Name)"
    
    $Bitlocker_Object = Get-ADObject -Filter {objectclass -eq 'msFVE-RecoveryInformation'} -SearchBase $objComputer.DistinguishedName -Properties 'msFVE-RecoveryPassword' | Select-Object msFVE-RecoveryPassword

    "$($_.Name)"
    if ($Bitlocker_Object.count -eq 0) {
        Write-Host "no entry"
    }elseif ($Bitlocker_Object.count -gt 1) {
        
        foreach ($Object in $Bitlocker_Object)
        {
            $Final_Object = $Object
        }
        $Final_Object
    }else {
        $Bitlocker_Object
    }
}

