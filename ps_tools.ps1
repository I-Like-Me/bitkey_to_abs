$collectionHash = @{}


Import-Csv .\compNameList.csv | ForEach-Object {
    $objComputer = Get-ADComputer "$($_.Name)"
    
    $Bitlocker_Object = Get-ADObject -Filter {objectclass -eq 'msFVE-RecoveryInformation'} -SearchBase $objComputer.DistinguishedName -Properties 'msFVE-RecoveryPassword' | Select-Object msFVE-RecoveryPassword

    if ($Bitlocker_Object.count -eq 0) {
        $collectionHash[$($_.Name)] = "no entry" 
    }elseif ($Bitlocker_Object.count -gt 1) {
        
        foreach ($Object in $Bitlocker_Object)
        {
            $Final_Object = $Object
        }
        $collectionHash[$($_.Name)] = $Final_Object
    }else {
        $collectionHash[$($_.Name)] = $Bitlocker_Object
    }
}

$collectionHash = [PSCustomObject]$collectionHash

$collectionHash | Export-CSV .\bitKeyList.csv