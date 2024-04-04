Start-Job -ScriptBlock { Get-Content $input } -InputObject "C:\Servers.txt"
Receive-Job -Name Job45 -Keep

start-job -Name "unlockTAHRDC01" {

    param([string]$username)
    
    if (Get-ADUser $username -Properties LockedOut -Server TAHR-SHR-DC01| Select-Object -ExpandProperty LockedOut){
    $resultsTAHRDC01 += "`r`nUser Is Locked on TAHR-SHR-DC01 Unlocking Now."
    Unlock-ADAccount -Identity $username -Server TAHR-SHR-DC01
    $resultsTAHRDC01 += "`r`nUser Is Unlocked on TAHR-SHR-DC01"}
    else{$resultsTAHRDC01 += "`r`nUser is not locked on TAHR-SHR-DC01"}
    
    return $resultsTAHRDC01
    } -ArgumentList $username
    Receive-Job -Name Job45 -Keep