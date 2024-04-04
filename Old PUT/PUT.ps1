
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")  
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 
[void] [System.Windows.Forms.Application]::EnableVisualStyles() 

<#
Notes For Eric:
Cntrl+K + Cntrl+0 Folds all
#>


<#Creates a file to store PUT Work History if it does not exist already #>
if (!(Test-Path C:\PUTWH.txt)){New-Item -Path "c:\" -Name "PUTWH.txt" -ItemType "file"}


<#Create GUI Elements Using .Net Objects#>

$basicForm = New-Object System.Windows.Forms.Form
    $basicForm.Text = "P.U.T. Version: 6.13.0"
    $basicForm.Size = New-Object System.Drawing.Size(563,730)
    $basicForm.FormBorderStyle = "Sizable"
    $basicForm.StartPosition = "CenterScreen"
    $basicForm.Icon = New-Object system.drawing.icon 'icon.ico'
    $basicForm.BackColor = "WhiteSmoke"

$pictureBox = new-object Windows.Forms.PictureBox 
    $art = [system.drawing.image]::FromFile(".\ART2.png")
    $pictureBox.AutoSize = $True
    $pictureBox.Image=$art
    $pictureBox.Location = "2,26" 

$lineLabel2 = New-Object System.Windows.Forms.Label
    $lineLabel2.Location = "0,150"
    $lineLabel2.Size = "700,2"
    $lineLabel2.BorderStyle = "Fixed3D"

$instructionslabel = New-Object System.Windows.Forms.Label  
    $instructionslabel.AutoSize = $true 
    $instructionslabel.Location = New-Object System.Drawing.Size(15,165)
    $instructionslabel.text = "Please enter users firstname.lastname or payroll number"
    $instructionslabel.font = [System.Drawing.Font]::new('Segoe UI', 11)
    
 
<#Creates a AutoCompleteStringCollection with all users and all payroll numbers in tampa OU for autocomplete#>
$autocomplete = New-Object System.Windows.Forms.AutoCompleteStringCollection
$autocomplete.AddRange((Get-ADUSER -Filter * -SearchBase "OU=TAHR,DC=seminolehardrock,DC=fl,DC=local" | Select-Object -ExpandProperty SamAccountName ))
$autocomplete.AddRange((Get-ADUSER -Filter * -SearchBase "OU=TAHR,DC=seminolehardrock,DC=fl,DC=local" -Properties employeeNumber | Select-Object -ExpandProperty employeeNumber))
$autocomplete.AddRange((Get-ADUSER -Filter * -SearchBase "OU=TAHR,DC=seminolehardrock,DC=fl,DC=local" -Properties employeeID | Select-Object -ExpandProperty employeeID))

$basicTextBox = New-Object System.Windows.Forms.TextBox
    $basicTextBox.Location = "15,195"
    $basicTextBox.Size = "300,23"
    $basicTextBox.AutoCompleteSource = "CustomSource"
    $basicTextBox.AutoCompleteMode = "SuggestAppend"
    $basicTextBox.AutoCompleteCustomSource = $autocomplete    

$ActCheckButton = New-Object System.Windows.Forms.Button
    $ActCheckButton.Text = "Account Check" 
    $ActCheckButton.Location = "385,195"
    $ActCheckButton.Size = "150,23"
    $ActCheckButton.BackColor = "15790320"

$basicButton = New-Object System.Windows.Forms.Button
    $basicButton.Text = "Account Unlock" 
    $basicButton.Location = "385,225"
    $basicButton.Size = "150,23"
    $basicButton.BackColor = "15790320"

$PODButton = New-Object System.Windows.Forms.Button
    $PODButton.Text = "Set Password Of Day" 
    $PODButton.Location = "385,255"
    $PODButton.Size = "150,23"
    $PODButton.BackColor = "15790320"

$expiredButton = New-Object System.Windows.Forms.Button
    $expiredButton.Text = "Set Password To Expired" 
    $expiredButton.Location = "385,285"
    $expiredButton.Size = "150,23"
    $expiredButton.BackColor = "15790320"

$pcButton = New-Object System.Windows.Forms.Button
    $pcButton.Text = "PC Lookup" 
    $pcButton.Location = "385,315"
    $pcButton.Size = "150,23"
    $pcButton.BackColor = "15790320"

$checkpcButton = New-Object System.Windows.Forms.Button
    $checkpcButton.Text = "Search For Computers" 
    $checkpcButton.Location = "385,345"
    $checkpcButton.Size = "150,23"
    $checkpcButton.BackColor = "15790320"

$ticket2Button = New-Object System.Windows.Forms.Button
    $ticket2Button.Text = "Pass Reset Ticket Text" 
    $ticket2Button.Location = "385,405"
    $ticket2Button.Size = "150,23"
    $ticket2Button.BackColor = "15790320"
    $ticket2Button.Visible = $False

$ticketButton = New-Object System.Windows.Forms.Button
    $ticketButton.Text = "Unlock Ticket Text" 
    $ticketButton.Location = "385,405"
    $ticketButton.Size = "150,23"
    $ticketButton.BackColor = "15790320"
    $ticketButton.Visible = $False

$clearhistoryButton = New-Object System.Windows.Forms.Button
    $clearhistoryButton.Text = "Clear History" 
    $clearhistoryButton.Location = "385,587"
    $clearhistoryButton.Size = "150,23"
    $clearhistoryButton.BackColor = "15790320"

$clearButton = New-Object System.Windows.Forms.Button
    $clearButton.Text = "Clear" 
    $clearButton.Location = "385,617"
    $clearButton.Size = "150,46"
    $clearButton.BackColor = "15790320"



$resultsTextBox = New-Object System.Windows.Forms.TextBox
    $resultsTextBox.Size = "350,420"
    $resultsTextBox.Location = "15,225"
    $resultsTextBox.ReadOnly = $True
    $resultsTextBox.BorderStyle = "None"
    $resultsTextBox.TabStop = $False
    $resultsTextBox.Multiline = $True
    $resultsTextBox.ScrollBars = "Vertical"
    $resultsTextBox.BackColor = "WhiteSmoke"

$checksyncButton = New-Object System.Windows.Forms.Button
    $checksyncButton.Size = "150,23"
    $checksyncButton.BackColor = "15790320"    
    $checksyncButton.Text = "Sync Check" 
    $checksyncButton.Location = "385,375"
    

$pc1button = New-Object System.Windows.Forms.Button
    $pc1button.Size = "150,23"
    $pc1button.BackColor = "15790320"    
    $pc1button.Text = "Copy 1st PC Name" 
    $pc1button.Location = "385,405"
    $pc1button.Visible = $False

$pc2button = New-Object System.Windows.Forms.Button
    $pc2button.Size = "150,23"
    $pc2button.BackColor = "15790320"    
    $pc2button.Text = "Copy 2nd PC Name" 
    $pc2button.Location = "385,435"
    $pc2button.Visible = $False

$pc3button = New-Object System.Windows.Forms.Button
    $pc3button.Size = "150,23"
    $pc3button.BackColor = "15790320"    
    $pc3button.Text = "Copy 3rd PC Name" 
    $pc3button.Location = "385,465"
    $pc3button.Visible = $False


$menuMain         = New-Object System.Windows.Forms.MenuStrip
    $menuMain.BackColor = "White"

$lineLabel = New-Object System.Windows.Forms.Label
    $lineLabel.Location = "0,24"
    $lineLabel.Size = "700,2"
    $lineLabel.BorderStyle = "Fixed3D"

$menuFile         = New-Object System.Windows.Forms.ToolStripMenuItem
    $menuFile.Text = "File"
    
$menuHistory = New-Object System.Windows.Forms.ToolStripMenuItem
    $menuHistory.Text = "Work History"
    $menuHistory.Add_Click({
    $resultsTextBox.Text = ""
    $resultsTextBox.Text = get-content "c:\PUTWH.txt" -Raw
})  

function OpenAbout {
  # Change into directory
	Set-Location $PSScriptRoot
    Invoke-Item -Path ".\About.lnk"
}

$menuAbout = New-Object System.Windows.Forms.ToolStripMenuItem
    $menuAbout.Text = "About"
    $menuAbout.Add_Click({OpenAbout})    

$menuHelp         = New-Object System.Windows.Forms.ToolStripMenuItem
    $menuHelp.Text = "Help"

$lookupHelp = New-Object System.Windows.Forms.ToolStripMenuItem
    $lookupHelp.Text = "Account Check Help"
    $lookupHelp.Add_Click({[System.Windows.Forms.MessageBox]::Show("This will reach out to gather information on the user such as Name,Payroll Numer, Last Password Date ect..",'Information','OKCancel')})

$unlockHelp = New-Object System.Windows.Forms.ToolStripMenuItem
    $unlockHelp.Text = "Account Unlock Help"
    $unlockHelp.Add_Click({[System.Windows.Forms.MessageBox]::Show("This button goes through and unlocks the specified user on the TAHR-SHR-DC01-03, HWHR-SHR-DC01-03, SGFB-SHR-DC01-02, SGHW-SHR-DC00, and SGTA-SHR-DC00. These are the domain controllers that we need updated to use apps.",'Information','OKCancel')})

$setpasswordHelp = New-Object System.Windows.Forms.ToolStripMenuItem
    $setpasswordHelp.Text = "Set Password Of Day Help"
    $setpasswordHelp.Add_Click({[System.Windows.Forms.MessageBox]::Show("This button goes through and sets the password of the specified user on the TAHR-SHR-DC01-03, HWHR-SHR-DC01-03, SGFB-SHR-DC01-02, SGHW-SHR-DC00, and SGTA-SHR-DC00. These are the domain controllers that we need updated to use apps.",'Information','OKCancel')})

$pcHelp = New-Object System.Windows.Forms.ToolStripMenuItem
    $pcHelp.Text = "PC Lookup Help"
    $pcHelp.Add_Click({[System.Windows.Forms.MessageBox]::Show("User must be signed in and connected to the T Drive for this function to operate.`r`n",'Information','OKCancel')})

$copyticketHelp = New-Object System.Windows.Forms.ToolStripMenuItem
    $copyticketHelp.Text = "Both Ticket Text Buttons Help"
    $copyticketHelp.Add_Click({[System.Windows.Forms.MessageBox]::Show("Copys the last username, and either unlock or password reset text, for you to conviently create tickets with.`r`nFormat is :`"Username needed an account unlock. Unlocked username's account.`" or username needed a password change. 
    Changed usernames's password.",'Information','OKCancel')})

$searchpcHelp = New-Object System.Windows.Forms.ToolStripMenuItem
    $searchpcHelp.Text = "Search For Computers Help"
    $searchpcHelp.Add_Click({[System.Windows.Forms.MessageBox]::Show("Type in part or whole computer name to find all registered devices with the entry in the TAHR location.",'Information','OKCancel')})


$statusStrip      = New-Object System.Windows.Forms.StatusStrip
New-Object System.Windows.Forms.ToolStripStatusLabel

<#
Unused .net Items for reference
$menuView         = New-Object System.Windows.Forms.ToolStripMenuItem
$menuTools        = New-Object System.Windows.Forms.ToolStripMenuItem
$menuOpen         = New-Object System.Windows.Forms.ToolStripMenuItem
$menuSave         = New-Object System.Windows.Forms.ToolStripMenuItem
$menuSaveAs       = New-Object System.Windows.Forms.ToolStripMenuItem
$menuFullScr      = New-Object System.Windows.Forms.ToolStripMenuItem
$menuOptions      = New-Object System.Windows.Forms.ToolStripMenuItem
$menuOptions1     = New-Object System.Windows.Forms.ToolStripMenuItem
$menuOptions2     = New-Object System.Windows.Forms.ToolStripMenuItem
$menuExit         = New-Object System.Windows.Forms.ToolStripMenuItem
$mainToolStrip    = New-Object System.Windows.Forms.ToolStrip
$toolStripOpen    = New-Object System.Windows.Forms.ToolStripButton
$toolStripSave    = New-Object System.Windows.Forms.ToolStripButton
$toolStripSaveAs  = New-Object System.Windows.Forms.ToolStripButton
$toolStripFullScr = New-Object System.Windows.Forms.ToolStripButton
$toolStripAbout   = New-Object System.Windows.Forms.ToolStripButton
$toolStripExit    = New-Object System.Windows.Forms.ToolStripButton
#>



<# Adds Form Elements to the form itself.#>
$basicForm.Controls.Add($resultsTextBox)
$basicForm.Controls.Add($basicButton)
$basicForm.Controls.Add($basicTextBox)
$basicForm.Controls.Add($basicButton)
$basicForm.Controls.Add($expiredButton)
$basicForm.Controls.Add($ActCheckButton)
$basicForm.Controls.Add($pcButton)
$basicForm.Controls.Add($checkpcButton)
$basicForm.Controls.Add($ticketButton)
$basicForm.Controls.Add($ticket2Button)
$basicForm.Controls.Add($PODButton)
$basicForm.Controls.Add($clearButton)
$basicForm.Controls.Add($clearhistoryButton)
$basicform.Controls.Add($instructionslabel)
$basicForm.Controls.Add($menuMain)
$basicForm.Controls.Add($statusStrip)
$basicForm.Controls.Add($pictureBox)
$basicForm.Controls.Add($lineLabel)
$basicForm.Controls.Add($lineLabel2)
$menuMain.Items.Add($menuFile)
$menuMain.Items.Add($menuAbout)
$menuFile.DropDownItems.Add($menuHistory)
$menuMain.Items.Add($menuHelp)
$menuHelp.DropDownItems.Add($lookupHelp)
$menuHelp.DropDownItems.Add($unlockHelp)
$menuHelp.DropDownItems.Add($setpasswordHelp)
$menuHelp.DropDownItems.Add($pcHelp)
$menuHelp.DropDownItems.Add($copyticketHelp)
$menuHelp.DropDownItems.Add($searchpcHelp)
$basicForm.Controls.Add($pc1button)
$basicForm.Controls.Add($pc2button)
$basicForm.Controls.Add($pc3button)
$basicForm.Controls.Add($checksyncButton)




<#Function to verify if the input was actually a username or payroll number#>
function verify {
        
    $initialinput = $basicTextBox.Text
    $global:verified = "No"

    if($initialinput -eq ""){$resultsTextBox.Text = "Invalid Entry Please Retry"}
    elseif($initialinput -match ".*\d+.*"){
        if (Get-ADUser -Filter "employeeNumber -eq $initialinput"){
        $global:employeenumber = $initialinput
        $global:username = Get-ADUser -Filter "employeeNumber -eq $initialinput" -Properties SamAccountName | Select-Object -ExpandProperty SamAccountName
        $global:verified = "Yes"
        }
        elseif (Get-ADUser -Filter "employeeID -eq $initialinput") {
            $global:employeenumber = $initialinput
            $global:username = Get-ADUser -Filter "employeeID -eq $initialinput" -Properties SamAccountName | Select-Object -ExpandProperty SamAccountName
            $global:verified = "Yes"
        }
        else{
             $resultsTextBox.Text = "Invalid Entry Please Retry"
             }
    }
    elseif( Get-ADUser -Filter "SamAccountName -eq '$initialinput'"){
    $global:username = $initialinput
    $global:employeenumber = (Get-ADUser -Filter "SamAccountName -eq '$initialinput'" -Properties SamAccountName,employeeNumber | Select-Object -ExpandProperty employeeNumber)
    $global:verified = "Yes"
    }
    else {
    $resultsTextBox.Text = "Invalid Entry Please Retry"
    }

}
<#Function to return information about the user#>
function actcheck {

    verify $initialinput
    if ($verified -eq "Yes"){
    
    $resultsTextBox.Text = "User is " + $global:username + " `r`nPayroll is " + $global:employeenumber
    
    $resultsTextBox.Text += "`r`nPassword last set on "
    $resultsTextBox.Text += Get-ADUser -identity $username -properties passwordlastset | Select-Object -ExpandProperty PasswordLastSet
    
    $resultsTextBox.Text += "`r`nAccount Description: "
    $resultsTextBox.Text += Get-ADUser -identity $username -properties description | Select-Object -ExpandProperty description
    
    
    if(Get-ADUser -identity $username | Select-Object -ExpandProperty Enabled){$resultsTextBox.Text += "`r`n" + $username + " is enabled`r`n"}
    else{$resultsTextBox.Text += "`r`n" + $username + " is not enabled`r`n"}
    }
}
<# Clears work buttons #>
function clearwork { 
$pc1button.Visible = $False
$pc2button.Visible = $False
$pc3button.Visible = $False
$ticket2Button.Visible = $False
$ticketButton.Visible = $False
}
<#Function to Unlock Account#>
function unlockact {
    if ($verified -eq "YES"){
    
    
        $ticketButton.Visible = $True
        
        $resultsTextBox.Text += "Please Wait While We Lookup Lockout Status."
        
        
        
        
        start-job -Name "unlockTAHRDC01" {
        
        param([string]$username)
        
        if (Get-ADUser $username -Properties LockedOut -Server TAHR-SHR-DC01| Select-Object -ExpandProperty LockedOut){
        $resultsTAHRDC01 += "`r`nUser Is Locked on TAHR-SHR-DC01 Unlocking Now."
        Unlock-ADAccount -Identity $username -Server TAHR-SHR-DC01
        $resultsTAHRDC01 += "`r`nUser Is Unlocked on TAHR-SHR-DC01"}
        else{$resultsTAHRDC01 += "`r`nUser is not locked on TAHR-SHR-DC01"}
        
        return $resultsTAHRDC01
        } -ArgumentList $username
        start-job -Name "unlockTAHRDC02" {
        
        param([string]$username)
        
        if (Get-ADUser $username -Properties LockedOut -Server TAHR-SHR-DC02| Select-Object -ExpandProperty LockedOut){
        $resultsTAHRDC02 += "`r`nUser Is Locked on TAHR-SHR-DC02 Unlocking Now."
        Unlock-ADAccount -Identity $username -Server TAHR-SHR-DC02
        $resultsTAHRDC02 += "`r`nUser Is Unlocked on TAHR-SHR-DC02"}
        else{$resultsTAHRDC02 += "`r`nUser is not locked on TAHR-SHR-DC02"}
        
        return $resultsTAHRDC02
        } -ArgumentList $username
        start-job -Name "unlockTAHRDC03" {
        
        param([string]$username)
        
        if (Get-ADUser $username -Properties LockedOut -Server TAHR-SHR-DC03| Select-Object -ExpandProperty LockedOut){
        $resultsTAHRDC03 += "`r`nUser Is Locked on TAHR-SHR-DC03 Unlocking Now."
        Unlock-ADAccount -Identity $username -Server TAHR-SHR-DC03
        $resultsTAHRDC03 += "`r`nUser Is Unlocked on TAHR-SHR-DC03"}
        else{$resultsTAHRDC03 += "`r`nUser is not locked on TAHR-SHR-DC03"}
        
        return $resultsTAHRDC03
        } -ArgumentList $username
        start-job -Name "unlockHWHRDC01" {
        
        param([string]$username)
        
        if (Get-ADUser $username -Properties LockedOut -Server HWHR-SHR-DC01| Select-Object -ExpandProperty LockedOut){
        $resultsHWHRDC01 += "`r`nUser Is Locked on HWHR-SHR-DC01 Unlocking Now."
        Unlock-ADAccount -Identity $username -Server HWHR-SHR-DC01
        $resultsHWHRDC01 += "`r`nUser Is Unlocked on HWHR-SHR-DC01"}
        else{$resultsHWHRDC01 += "`r`nUser is not locked on HWHR-SHR-DC01"}
        
        return $resultsHWHRDC01
        } -ArgumentList $username
        start-job -Name "unlockHWHRDC02" {
        
        param([string]$username)
        
        if (Get-ADUser $username -Properties LockedOut -Server HWHR-SHR-DC02| Select-Object -ExpandProperty LockedOut){
        $resultsHWHRDC02 += "`r`nUser Is Locked on HWHR-SHR-DC02 Unlocking Now."
        Unlock-ADAccount -Identity $username -Server HWHR-SHR-DC02
        $resultsHWHRDC02 += "`r`nUser Is Unlocked on HWHR-SHR-DC02"}
        else{$resultsHWHRDC02 += "`r`nUser is not locked on HWHR-SHR-DC02"}
        
        return $resultsHWHRDC02
        } -ArgumentList $username
        start-job -Name "unlockHWHRDC03" {
        
        param([string]$username)
        
        if (Get-ADUser $username -Properties LockedOut -Server HWHR-SHR-DC03| Select-Object -ExpandProperty LockedOut){
        $resultsHWHRDC03 += "`r`nUser Is Locked on HWHR-SHR-DC03 Unlocking Now."
        Unlock-ADAccount -Identity $username -Server HWHR-SHR-DC03
        $resultsHWHRDC03 += "`r`nUser Is Unlocked on HWHR-SHR-DC03"}
        else{$resultsHWHRDC03 += "`r`nUser is not locked on HWHR-SHR-DC03"}
        
        return $resultsHWHRDC03
        } -ArgumentList $username
        start-job -Name "unlockSGFBDC01" {
        
        param([string]$username)
        
        if (Get-ADUser $username -Properties LockedOut -Server SGFB-SHR-DC01| Select-Object -ExpandProperty LockedOut){
        $resultsSGFBDC01 += "`r`nUser Is Locked on SGFB-SHR-DC01 Unlocking Now."
        Unlock-ADAccount -Identity $username -Server SGFB-SHR-DC01
        $resultsSGFBDC01 += "`r`nUser Is Unlocked on SGFB-SHR-DC01"}
        else{$resultsSGFBDC01 += "`r`nUser is not locked on SGFB-SHR-DC01"}
        
        return $resultsSGFBDC01
        } -ArgumentList $username
        start-job -Name "unlockSGFBDC02" {
        
        param([string]$username)
        
        if (Get-ADUser $username -Properties LockedOut -Server SGFB-SHR-DC02| Select-Object -ExpandProperty LockedOut){
        $resultsSGFBDC02 += "`r`nUser Is Locked on SGFB-SHR-DC02 Unlocking Now."
        Unlock-ADAccount -Identity $username -Server SGFB-SHR-DC02
        $resultsSGFBDC02 += "`r`nUser Is Unlocked on SGFB-SHR-DC02"}
        else{$resultsSGFBDC02 += "`r`nUser is not locked on SGFB-SHR-DC02"}
        
        return $resultsSGFBDC02
        } -ArgumentList $username
        start-job -Name "unlockHWHRDC03" {
        
        param([string]$username)
        
        if (Get-ADUser $username -Properties LockedOut -Server HWHR-SHR-DC03| Select-Object -ExpandProperty LockedOut){
        $resultsHWHRDC03 += "`r`nUser Is Locked on HWHR-SHR-DC03 Unlocking Now."
        Unlock-ADAccount -Identity $username -Server HWHR-SHR-DC03
        $resultsHWHRDC03 += "`r`nUser Is Unlocked on HWHR-SHR-DC03"}
        else{$resultsHWHRDC03 += "`r`nUser is not locked on HWHR-SHR-DC03"}
        
        return $resultsHWHRDC03
        } -ArgumentList $username
        start-job -Name "unlockSGHWDC00" {
        
        param([string]$username)
        
        if (Get-ADUser $username -Properties LockedOut -Server SGHW-SHR-DC00| Select-Object -ExpandProperty LockedOut){
        $resultsSGHDCW00 += "`r`nUser Is Locked on SGHW-SHR-DC00 Unlocking Now."
        Unlock-ADAccount -Identity $username -Server SGHW-SHR-DC00
        $resultsSGHWDC00 += "`r`nUser Is Unlocked on SGHW-SHR-DC00"}
        else{$resultsSGHWDC00 += "`r`nUser is not locked on SGHW-SHR-DC00"}
        
        return $resultsSGHWDC00
        } -ArgumentList $username
        start-job -Name "unlockSGTADC00" {
        
        param([string]$username)
        
        if (Get-ADUser $username -Properties LockedOut -Server SGTA-SHR-DC00| Select-Object -ExpandProperty LockedOut){
        $resultsSGTADC00 += "`r`nUser Is Locked on SGTA-SHR-DC00 Unlocking Now."
        Unlock-ADAccount -Identity $username -Server SGTA-SHR-DC00
        $resultsSGTADC00 += "`r`nUser Is Unlocked on SGTA-SHR-DC00"}
        else{$resultsSGTADC00 += "`r`nUser is not locked on SGTA-SHR-DC00"}
        
        return $resultsSGTADC00
        } -ArgumentList $username
          
        
        $results += Wait-Job -Name "unlockTAHRDC01" | Receive-Job
        $results += Wait-Job -Name "unlockTAHRDC02" | Receive-Job
        $results += Wait-Job -Name "unlockTAHRDC03" | Receive-Job
        $results += Wait-Job -Name "unlockHWHRDC01" | Receive-Job
        $results += Wait-Job -Name "unlockHWHRDC02" | Receive-Job
        $results += Wait-Job -Name "unlockHWHRDC03" | Receive-Job
        $results += Wait-Job -Name "unlockSGFBDC01" | Receive-Job
        $results += Wait-Job -Name "unlockSGFBDC02" | Receive-Job
        $results += Wait-Job -Name "unlockSGHWDC00" | Receive-Job
        $results += Wait-Job -Name "unlockSGTADC00" | Receive-Job
        Remove-Job -Name "unlockTAHRDC01"
        Remove-Job -Name "unlockTAHRDC02"
        Remove-Job -Name "unlockTAHRDC03"
        Remove-Job -Name "unlockHWHRDC01"
        Remove-Job -Name "unlockHWHRDC02"
        Remove-Job -Name "unlockHWHRDC03"
        Remove-Job -Name "unlockSGFBDC01"
        Remove-Job -Name "unlockSGFBDC02"
        Remove-Job -Name "unlockSGHWDC00"
        Remove-Job -Name "unlockSGTADC00" 
        
        $unlock = "`r`n" + $global:username + " needed a password unlock. Unlocked " + $global:username + "`r`n"
        Add-Content -Path c:\PUTWH.txt -Value $unlock
        Add-Content -Path c:\PUTWH.txt -Value `r`n
        
        $resultsTextBox.Text += $results
        }
}
<#Unlocks the account but doesnt add to work history and only displays once#>
function unlockact2 {
    if ($verified -eq "YES"){
    
    
        $ticketButton.Visible = $True
        
        $resultsTextBox.Text += "`r`nPlease Wait While We Lookup Lockout Status."
        
        
        
        
        start-job -Name "unlockTAHRDC01" {
        
        param([string]$username)
        
        if (Get-ADUser $username -Properties LockedOut -Server TAHR-SHR-DC01| Select-Object -ExpandProperty LockedOut){
        $resultsTAHRDC01 += "`r`nUser Is Locked on TAHR-SHR-DC01 Unlocking Now."
        Unlock-ADAccount -Identity $username -Server TAHR-SHR-DC01
        $resultsTAHRDC01 += "`r`nUser Is Unlocked on TAHR-SHR-DC01"}
        else{$resultsTAHRDC01 += "`r`nUser is not locked on TAHR-SHR-DC01"}
        
        return $resultsTAHRDC01
        } -ArgumentList $username
        start-job -Name "unlockTAHRDC02" {
        
        param([string]$username)
        
        if (Get-ADUser $username -Properties LockedOut -Server TAHR-SHR-DC02| Select-Object -ExpandProperty LockedOut){
        $resultsTAHRDC02 += "`r`nUser Is Locked on TAHR-SHR-DC02 Unlocking Now."
        Unlock-ADAccount -Identity $username -Server TAHR-SHR-DC02
        $resultsTAHRDC02 += "`r`nUser Is Unlocked on TAHR-SHR-DC02"}
        else{$resultsTAHRDC02 += "`r`nUser is not locked on TAHR-SHR-DC02"}
        
        return $resultsTAHRDC02
        } -ArgumentList $username
        start-job -Name "unlockTAHRDC03" {
        
        param([string]$username)
        
        if (Get-ADUser $username -Properties LockedOut -Server TAHR-SHR-DC03| Select-Object -ExpandProperty LockedOut){
        $resultsTAHRDC03 += "`r`nUser Is Locked on TAHR-SHR-DC03 Unlocking Now."
        Unlock-ADAccount -Identity $username -Server TAHR-SHR-DC03
        $resultsTAHRDC03 += "`r`nUser Is Unlocked on TAHR-SHR-DC03"}
        else{$resultsTAHRDC03 += "`r`nUser is not locked on TAHR-SHR-DC03"}
        
        return $resultsTAHRDC03
        } -ArgumentList $username
        start-job -Name "unlockHWHRDC01" {
        
        param([string]$username)
        
        if (Get-ADUser $username -Properties LockedOut -Server HWHR-SHR-DC01| Select-Object -ExpandProperty LockedOut){
        $resultsHWHRDC01 += "`r`nUser Is Locked on HWHR-SHR-DC01 Unlocking Now."
        Unlock-ADAccount -Identity $username -Server HWHR-SHR-DC01
        $resultsHWHRDC01 += "`r`nUser Is Unlocked on HWHR-SHR-DC01"}
        else{$resultsHWHRDC01 += "`r`nUser is not locked on HWHR-SHR-DC01"}
        
        return $resultsHWHRDC01
        } -ArgumentList $username
        start-job -Name "unlockHWHRDC02" {
        
        param([string]$username)
        
        if (Get-ADUser $username -Properties LockedOut -Server HWHR-SHR-DC02| Select-Object -ExpandProperty LockedOut){
        $resultsHWHRDC02 += "`r`nUser Is Locked on HWHR-SHR-DC02 Unlocking Now."
        Unlock-ADAccount -Identity $username -Server HWHR-SHR-DC02
        $resultsHWHRDC02 += "`r`nUser Is Unlocked on HWHR-SHR-DC02"}
        else{$resultsHWHRDC02 += "`r`nUser is not locked on HWHR-SHR-DC02"}
        
        return $resultsHWHRDC02
        } -ArgumentList $username
        start-job -Name "unlockHWHRDC03" {
        
        param([string]$username)
        
        if (Get-ADUser $username -Properties LockedOut -Server HWHR-SHR-DC03| Select-Object -ExpandProperty LockedOut){
        $resultsHWHRDC03 += "`r`nUser Is Locked on HWHR-SHR-DC03 Unlocking Now."
        Unlock-ADAccount -Identity $username -Server HWHR-SHR-DC03
        $resultsHWHRDC03 += "`r`nUser Is Unlocked on HWHR-SHR-DC03"}
        else{$resultsHWHRDC03 += "`r`nUser is not locked on HWHR-SHR-DC03"}
        
        return $resultsHWHRDC03
        } -ArgumentList $username
        start-job -Name "unlockSGFBDC01" {
        
        param([string]$username)
        
        if (Get-ADUser $username -Properties LockedOut -Server SGFB-SHR-DC01| Select-Object -ExpandProperty LockedOut){
        $resultsSGFBDC01 += "`r`nUser Is Locked on SGFB-SHR-DC01 Unlocking Now."
        Unlock-ADAccount -Identity $username -Server SGFB-SHR-DC01
        $resultsSGFBDC01 += "`r`nUser Is Unlocked on SGFB-SHR-DC01"}
        else{$resultsSGFBDC01 += "`r`nUser is not locked on SGFB-SHR-DC01"}
        
        return $resultsSGFBDC01
        } -ArgumentList $username
        start-job -Name "unlockSGFBDC02" {
        
        param([string]$username)
        
        if (Get-ADUser $username -Properties LockedOut -Server SGFB-SHR-DC02| Select-Object -ExpandProperty LockedOut){
        $resultsSGFBDC02 += "`r`nUser Is Locked on SGFB-SHR-DC02 Unlocking Now."
        Unlock-ADAccount -Identity $username -Server SGFB-SHR-DC02
        $resultsSGFBDC02 += "`r`nUser Is Unlocked on SGFB-SHR-DC02"}
        else{$resultsSGFBDC02 += "`r`nUser is not locked on SGFB-SHR-DC02"}
        
        return $resultsSGFBDC02
        } -ArgumentList $username
        start-job -Name "unlockHWHRDC03" {
        
        param([string]$username)
        
        if (Get-ADUser $username -Properties LockedOut -Server HWHR-SHR-DC03| Select-Object -ExpandProperty LockedOut){
        $resultsHWHRDC03 += "`r`nUser Is Locked on HWHR-SHR-DC03 Unlocking Now."
        Unlock-ADAccount -Identity $username -Server HWHR-SHR-DC03
        $resultsHWHRDC03 += "`r`nUser Is Unlocked on HWHR-SHR-DC03"}
        else{$resultsHWHRDC03 += "`r`nUser is not locked on HWHR-SHR-DC03"}
        
        return $resultsHWHRDC03
        } -ArgumentList $username
        start-job -Name "unlockSGHWDC00" {
        
        param([string]$username)
        
        if (Get-ADUser $username -Properties LockedOut -Server SGHW-SHR-DC00| Select-Object -ExpandProperty LockedOut){
        $resultsSGHDCW00 += "`r`nUser Is Locked on SGHW-SHR-DC00 Unlocking Now."
        Unlock-ADAccount -Identity $username -Server SGHW-SHR-DC00
        $resultsSGHWDC00 += "`r`nUser Is Unlocked on SGHW-SHR-DC00"}
        else{$resultsSGHWDC00 += "`r`nUser is not locked on SGHW-SHR-DC00"}
        
        return $resultsSGHWDC00
        } -ArgumentList $username
        start-job -Name "unlockSGTADC00" {
        
        param([string]$username)
        
        if (Get-ADUser $username -Properties LockedOut -Server SGTA-SHR-DC00| Select-Object -ExpandProperty LockedOut){
        $resultsSGTADC00 += "`r`nUser Is Locked on SGTA-SHR-DC00 Unlocking Now."
        Unlock-ADAccount -Identity $username -Server SGTA-SHR-DC00
        $resultsSGTADC00 += "`r`nUser Is Unlocked on SGTA-SHR-DC00"}
        else{$resultsSGTADC00 += "`r`nUser is not locked on SGTA-SHR-DC00"}
        
        return $resultsSGTADC00
        } -ArgumentList $username
          
        
        $results += Wait-Job -Name "unlockTAHRDC01" | Receive-Job
<#      $results += Wait-Job -Name "unlockTAHRDC02" | Receive-Job
        $results += Wait-Job -Name "unlockTAHRDC03" | Receive-Job
        $results += Wait-Job -Name "unlockHWHRDC01" | Receive-Job
        $results += Wait-Job -Name "unlockHWHRDC02" | Receive-Job
        $results += Wait-Job -Name "unlockHWHRDC03" | Receive-Job
        $results += Wait-Job -Name "unlockSGFBDC01" | Receive-Job
        $results += Wait-Job -Name "unlockSGFBDC02" | Receive-Job
        $results += Wait-Job -Name "unlockSGHWDC00" | Receive-Job
        $results += Wait-Job -Name "unlockSGTADC00" | Receive-Job  #>
        Remove-Job -Name "unlockTAHRDC01"
        Remove-Job -Name "unlockTAHRDC02"
        Remove-Job -Name "unlockTAHRDC03"
        Remove-Job -Name "unlockHWHRDC01"
        Remove-Job -Name "unlockHWHRDC02"
        Remove-Job -Name "unlockHWHRDC03"
        Remove-Job -Name "unlockSGFBDC01"
        Remove-Job -Name "unlockSGFBDC02"
        Remove-Job -Name "unlockSGHWDC00"
        Remove-Job -Name "unlockSGTADC00" 
        
        
        $resultsTextBox.Text += $results
        }
}


<#Checks info for account.#>
$ActCheckButton.Add_Click({
actcheck
clearwork
})

<# Adds Functionality to the Unlock button #>
$basicButton.Add_Click({ 

actcheck
clearwork
unlockact

})

<# Starts PC Lookup on pcButton Click#>
$pcButton.Add_Click({

actcheck  
clearwork
if ($verified -eq "YES"){
  
$ip = Get-WmiObject Win32_ServerConnection -ComputerName 10.16.1.41 | Where-Object UserName -eq $username | Select-Object -ExpandProperty ComputerName

$global:pcnames = @()

foreach ($number in $ip){
$pcname = Resolve-DnsName $number | Select-Object -ExpandProperty NameHost
$pcname = $pcname.split('.')[0]

$global:pcnames += $pcname

$pcInfo = "`r`n" + $username + " is on " + $pcname

$pcInfo += "`r`nIP = " + $number

$pcInfo += "`r`nUptime for this device = " + ((Get-Date) - [Management.ManagementDateTimeConverter]::ToDateTime((Get-WmiObject Win32_OperatingSystem -ComputerName $number).LastBootUpTime) | Select-Object -ExpandProperty Days) + " Days`r`n" +
((Get-Date) - [Management.ManagementDateTimeConverter]::ToDateTime((Get-WmiObject Win32_OperatingSystem -ComputerName $number).LastBootUpTime) | Select-Object -ExpandProperty Hours) + " Hours`r`n" +
((Get-Date) - [Management.ManagementDateTimeConverter]::ToDateTime((Get-WmiObject Win32_OperatingSystem -ComputerName $number).LastBootUpTime) | Select-Object -ExpandProperty Minutes) + " Minutes`r`n" +
((Get-Date) - [Management.ManagementDateTimeConverter]::ToDateTime((Get-WmiObject Win32_OperatingSystem -ComputerName $number).LastBootUpTime) | Select-Object -ExpandProperty Seconds) + " Seconds`r`n" 
$resultsTextBox.Text += $pcInfo

$pcversion = Get-ADComputer -Properties Operatingsystem -Filter * | Where-Object {$_.Name -like $pcname} | Select-Object -ExpandProperty Operatingsystem
$pcDescription = Get-ADComputer -Properties Description -Filter * | Where-Object {$_.Name -like $pcname} | Select-Object -ExpandProperty Description
$resultsTextBox.Text += $pcname + " is " + $pcversion + "`r`nThe description says: " + $pcDescription + "`r`n"
}

$pc1button.Visible = $True
$pc2button.Visible = $True
$pc3button.Visible = $True
$pc1button.Add_Click({Set-Clipboard -Value $pcnames[0]})
$pc2button.Add_Click({Set-Clipboard -Value $pcnames[1]})
$pc3button.Add_Click({Set-Clipboard -Value $pcnames[2]})


}
})

<# Sets Clipboard to a string to paste into a ticket for account unlocks#>
$ticketButton.Add_Click({

$tickettext = $username + " needed an account unlock. `r`nUnlocked " + $username + "'s account."
$resultsTextBox.Text = "Clipboard now contains:`r`n" + $tickettext
Set-Clipboard -Value $tickettext
})

<# Sets Clipboard to a string to paste into a ticket for password resets#>
$ticket2Button.Add_Click({

$tickettext = $username + " needed a password change. `r`nChanged " + $username + "'s password."
$resultsTextBox.Text = "Clipboard now contains:`r`n" + $tickettext
Set-Clipboard -Value $tickettext
})

<#Sets Users Password To Password of the day#>
$PODButton.Add_Click({ 

actcheck
clearwork

if ($verified -eq "YES"){

$msgBoxInput =  [System.Windows.Forms.MessageBox]::Show("Are you sure you want to set $username's password to the password of the day?",'Are you sure?','YesNoCancel')

switch  ($msgBoxInput) {
  'Yes' {
$ticket2Button.Visible = $True

$resultsTextBox.Text = "User is " + $global:username + " `r`nPayroll is " + $global:employeenumber

$msgBoxInput2 =  [System.Windows.Forms.MessageBox]::Show("Do you want to set password to expired?",'Set to change?','YesNoCancel')
    switch ($msgBoxInput2) {
        'Yes'{
            unlockact2

            start-job -Name "PODChangeandExpireTAHRDC01" {

            param([string]$username)
            
            $Passofdayunsecure = "Password@" 
            $Passofdayunsecure += Get-Date -Format "MMdd"
            $Passofday = $Passofdayunsecure | ConvertTo-SecureString -AsPlainText -Force
            
            Set-ADAccountPassword -Identity $username -Server TAHR-SHR-DC01 -NewPassword $Passofday -Reset
            
            Get-ADUser -Identity $username -Server TAHR-SHR-DC01 | Set-ADUser -ChangePasswordAtLogon:$true

            return "`r`nPassword set to password of the day on TAHR-SHR-DC01 and set to expired."
            } -ArgumentList $username
            start-job -Name "PODChangeandExpireTAHRDC02" {
            
            param([string]$username)
            
            $Passofdayunsecure = "Password@" 
            $Passofdayunsecure += Get-Date -Format "MMdd"
            $Passofday = $Passofdayunsecure | ConvertTo-SecureString -AsPlainText -Force
            
            Set-ADAccountPassword -Identity $username -Server TAHR-SHR-DC02 -NewPassword $Passofday -Reset
            Get-ADUser -Identity $username -Server TAHR-SHR-DC02 | Set-ADUser -ChangePasswordAtLogon:$true

            return "`r`nPassword set to password of the day on TAHR-SHR-DC02 and set to expired."
            } -ArgumentList $username
            start-job -Name "PODChangeandExpireTAHRDC03" {
            
            param([string]$username)
            
            $Passofdayunsecure = "Password@" 
            $Passofdayunsecure += Get-Date -Format "MMdd"
            $Passofday = $Passofdayunsecure | ConvertTo-SecureString -AsPlainText -Force
            
            Set-ADAccountPassword -Identity $username -Server TAHR-SHR-DC03 -NewPassword $Passofday -Reset
            Get-ADUser -Identity $username -Server TAHR-SHR-DC03 | Set-ADUser -ChangePasswordAtLogon:$true

            return "`r`nPassword set to password of the day on TAHR-SHR-DC03 and set to expired."
            } -ArgumentList $username
            start-job -Name "PODChangeandExpireHWHRDC01" {
            
            param([string]$username)
            
            $Passofdayunsecure = "Password@" 
            $Passofdayunsecure += Get-Date -Format "MMdd"
            $Passofday = $Passofdayunsecure | ConvertTo-SecureString -AsPlainText -Force
            
            Set-ADAccountPassword -Identity $username -Server HWHR-SHR-DC01 -NewPassword $Passofday -Reset
            Get-ADUser -Identity $username -Server HWHR-SHR-DC01 | Set-ADUser -ChangePasswordAtLogon:$true

            return "`r`nPassword set to password of the day on HWHR-SHR-DC01 and set to expired."
            } -ArgumentList $username
            start-job -Name "PODChangeandExpireHWHRDC02" {
            
            param([string]$username)
            
            $Passofdayunsecure = "Password@" 
            $Passofdayunsecure += Get-Date -Format "MMdd"
            $Passofday = $Passofdayunsecure | ConvertTo-SecureString -AsPlainText -Force
            
            Set-ADAccountPassword -Identity $username -Server HWHR-SHR-DC01 -NewPassword $Passofday -Reset
            Get-ADUser -Identity $username -Server HWHR-SHR-DC02 | Set-ADUser -ChangePasswordAtLogon:$true

            return "`r`nPassword set to password of the day on HWHR-SHR-DC02 and set to expired."
            } -ArgumentList $username
            start-job -Name "PODChangeandExpireHWHRDC03" {
            
            param([string]$username)
            
            $Passofdayunsecure = "Password@" 
            $Passofdayunsecure += Get-Date -Format "MMdd"
            $Passofday = $Passofdayunsecure | ConvertTo-SecureString -AsPlainText -Force
            
            Set-ADAccountPassword -Identity $username -Server HWHR-SHR-DC03 -NewPassword $Passofday -Reset
            Get-ADUser -Identity $username -Server HWHR-SHR-DC03 | Set-ADUser -ChangePasswordAtLogon:$true

            return "`r`nPassword set to password of the day on HWHR-SHR-DC03 and set to expired."
            } -ArgumentList $username
            start-job -Name "PODChangeandExpireSGFBDC01" {
            
            param([string]$username)
            
            $Passofdayunsecure = "Password@" 
            $Passofdayunsecure += Get-Date -Format "MMdd"
            $Passofday = $Passofdayunsecure | ConvertTo-SecureString -AsPlainText -Force
            
            Set-ADAccountPassword -Identity $username -Server SGFB-SHR-DC01 -NewPassword $Passofday -Reset
            Get-ADUser -Identity $username -Server SGFB-SHR-DC01 | Set-ADUser -ChangePasswordAtLogon:$true

            return "`r`nPassword set to password of the day on SGFB-SHR-DC01 and set to expired."
            } -ArgumentList $username
            start-job -Name "PODChangeandExpireSGFBDC02" {
            
            param([string]$username)
            
            $Passofdayunsecure = "Password@" 
            $Passofdayunsecure += Get-Date -Format "MMdd"
            $Passofday = $Passofdayunsecure | ConvertTo-SecureString -AsPlainText -Force
            
            Set-ADAccountPassword -Identity $username -Server SGFB-SHR-DC02 -NewPassword $Passofday -Reset
            Get-ADUser -Identity $username -Server SGFB-SHR-DC02 | Set-ADUser -ChangePasswordAtLogon:$true

            return "`r`nPassword set to password of the day on SGFB-SHR-DC02 and set to expired."
            } -ArgumentList $username
            start-job -Name "PODChangeandExpireSGHWDC00" {
            
            param([string]$username)
            
            $Passofdayunsecure = "Password@" 
            $Passofdayunsecure += Get-Date -Format "MMdd"
            $Passofday = $Passofdayunsecure | ConvertTo-SecureString -AsPlainText -Force
            
            Set-ADAccountPassword -Identity $username -Server SGHW-SHR-DC00 -NewPassword $Passofday -Reset
            Get-ADUser -Identity $username -Server SGHW-SHR-DC00 | Set-ADUser -ChangePasswordAtLogon:$true

            return "`r`nPassword set to password of the day on SGHW-SHR-DC00 and set to expired."
            } -ArgumentList $username
            start-job -Name "PODChangeandExpireSGTADC00" {
            
            param([string]$username)
            
            $Passofdayunsecure = "Password@" 
            $Passofdayunsecure += Get-Date -Format "MMdd"
            $Passofday = $Passofdayunsecure | ConvertTo-SecureString -AsPlainText -Force
            
            Set-ADAccountPassword -Identity $username -Server SGTA-SHR-DC00 -NewPassword $Passofday -Reset
            Get-ADUser -Identity $username -Server SGTA-SHR-DC00 | Set-ADUser -ChangePasswordAtLogon:$true

            return "`r`nPassword set to password of the day on SGTA-SHR-DC00 and set to expired."
            } -ArgumentList $username 

            $results += Wait-Job -Name "PODChangeandExpireTAHRDC01" | Receive-Job
            $results += Wait-Job -Name "PODChangeandExpireTAHRDC02" | Receive-Job
            $results += Wait-Job -Name "PODChangeandExpireTAHRDC03" | Receive-Job
            $results += Wait-Job -Name "PODChangeandExpireHWHRDC01" | Receive-Job
            $results += Wait-Job -Name "PODChangeandExpireHWHRDC02" | Receive-Job
            $results += Wait-Job -Name "PODChangeandExpireHWHRDC03" | Receive-Job
            $results += Wait-Job -Name "PODChangeandExpireSGFBDC01" | Receive-Job
            $results += Wait-Job -Name "PODChangeandExpireSGFBDC02" | Receive-Job
            $results += Wait-Job -Name "PODChangeandExpireSGHWDC00" | Receive-Job
            $results += Wait-Job -Name "PODChangeandExpireSGTADC00" | Receive-Job
   

            Remove-Job -Name "PODChangeandExpireTAHRDC01"
            Remove-Job -Name "PODChangeandExpireTAHRDC02"
            Remove-Job -Name "PODChangeandExpireTAHRDC03"
            Remove-Job -Name "PODChangeandExpireHWHRDC01"
            Remove-Job -Name "PODChangeandExpireHWHRDC02"
            Remove-Job -Name "PODChangeandExpireHWHRDC03"
            Remove-Job -Name "PODChangeandExpireSGFBDC01"
            Remove-Job -Name "PODChangeandExpireSGFBDC02"
            Remove-Job -Name "PODChangeandExpireSGHWDC00"
            Remove-Job -Name "PODChangeandExpireSGTADC00"

            
            $reset = $global:username + " needed a password reset. Reset " + $global:username + "'s Password, and set it to expire.`r`n"
            Add-Content -Path c:\PUTWH.txt -Value $reset
            
            
            $resultsTextBox.Text += $results
            }
        'No' {
                unlockact
                
                start-job -Name "PODChangeTAHRDC01" {

                param([string]$username)
                
                $Passofdayunsecure = "Password@" 
                $Passofdayunsecure += Get-Date -Format "MMdd"
                $Passofday = $Passofdayunsecure | ConvertTo-SecureString -AsPlainText -Force
                
                Set-ADAccountPassword -Identity $username -Server TAHR-SHR-DC01 -NewPassword $Passofday -Reset
                
                return "`r`nPassword set to password of the day on TAHR-SHR-DC01"
                } -ArgumentList $username
                start-job -Name "PODChangeTAHRDC02" {
                
                param([string]$username)
                
                $Passofdayunsecure = "Password@" 
                $Passofdayunsecure += Get-Date -Format "MMdd"
                $Passofday = $Passofdayunsecure | ConvertTo-SecureString -AsPlainText -Force
                
                Set-ADAccountPassword -Identity $username -Server TAHR-SHR-DC02 -NewPassword $Passofday -Reset
                
                return "`r`nPassword set to password of the day on TAHR-SHR-DC02"
                } -ArgumentList $username
                start-job -Name "PODChangeTAHRDC03" {
                
                param([string]$username)
                
                $Passofdayunsecure = "Password@" 
                $Passofdayunsecure += Get-Date -Format "MMdd"
                $Passofday = $Passofdayunsecure | ConvertTo-SecureString -AsPlainText -Force
                
                Set-ADAccountPassword -Identity $username -Server TAHR-SHR-DC03 -NewPassword $Passofday -Reset
                
                return "`r`nPassword set to password of the day on TAHR-SHR-DC03"
                } -ArgumentList $username
                start-job -Name "PODChangeHWHRDC01" {
                
                param([string]$username)
                
                $Passofdayunsecure = "Password@" 
                $Passofdayunsecure += Get-Date -Format "MMdd"
                $Passofday = $Passofdayunsecure | ConvertTo-SecureString -AsPlainText -Force
                
                Set-ADAccountPassword -Identity $username -Server HWHR-SHR-DC01 -NewPassword $Passofday -Reset
                
                return "`r`nPassword set to password of the day on HWHR-SHR-DC01"
                } -ArgumentList $username
                start-job -Name "PODChangeHWHRDC02" {
                
                param([string]$username)
                
                $Passofdayunsecure = "Password@" 
                $Passofdayunsecure += Get-Date -Format "MMdd"
                $Passofday = $Passofdayunsecure | ConvertTo-SecureString -AsPlainText -Force
                
                Set-ADAccountPassword -Identity $username -Server HWHR-SHR-DC01 -NewPassword $Passofday -Reset
                
                return "`r`nPassword set to password of the day on HWHR-SHR-DC02"
                } -ArgumentList $username
                start-job -Name "PODChangeHWHRDC03" {
                
                param([string]$username)
                
                $Passofdayunsecure = "Password@" 
                $Passofdayunsecure += Get-Date -Format "MMdd"
                $Passofday = $Passofdayunsecure | ConvertTo-SecureString -AsPlainText -Force
                
                Set-ADAccountPassword -Identity $username -Server HWHR-SHR-DC03 -NewPassword $Passofday -Reset
                
                return "`r`nPassword set to password of the day on HWHR-SHR-DC03"
                } -ArgumentList $username
                start-job -Name "PODChangeSGFBDC01" {
                
                param([string]$username)
                
                $Passofdayunsecure = "Password@" 
                $Passofdayunsecure += Get-Date -Format "MMdd"
                $Passofday = $Passofdayunsecure | ConvertTo-SecureString -AsPlainText -Force
                
                Set-ADAccountPassword -Identity $username -Server SGFB-SHR-DC01 -NewPassword $Passofday -Reset
                
                return "`r`nPassword set to password of the day on SGFB-SHR-DC01"
                } -ArgumentList $username
                start-job -Name "PODChangeSGFBDC02" {
                
                param([string]$username)
                
                $Passofdayunsecure = "Password@" 
                $Passofdayunsecure += Get-Date -Format "MMdd"
                $Passofday = $Passofdayunsecure | ConvertTo-SecureString -AsPlainText -Force
                
                Set-ADAccountPassword -Identity $username -Server SGFB-SHR-DC02 -NewPassword $Passofday -Reset
                
                return "`r`nPassword set to password of the day on SGFB-SHR-DC02"
                } -ArgumentList $username
                start-job -Name "PODChangeSGHWDC00" {
                
                param([string]$username)
                
                $Passofdayunsecure = "Password@" 
                $Passofdayunsecure += Get-Date -Format "MMdd"
                $Passofday = $Passofdayunsecure | ConvertTo-SecureString -AsPlainText -Force
                
                Set-ADAccountPassword -Identity $username -Server SGHW-SHR-DC00 -NewPassword $Passofday -Reset
                
                return "`r`nPassword set to password of the day on SGHW-SHR-DC00"
                } -ArgumentList $username
                start-job -Name "PODChangeSGTADC00" {
                
                param([string]$username)
                
                $Passofdayunsecure = "Password@" 
                $Passofdayunsecure += Get-Date -Format "MMdd"
                $Passofday = $Passofdayunsecure | ConvertTo-SecureString -AsPlainText -Force
                
                Set-ADAccountPassword -Identity $username -Server SGTA-SHR-DC00 -NewPassword $Passofday -Reset
                
                return "`r`nPassword set to password of the day on SGTA-SHR-DC00"
                } -ArgumentList $username 
                
                
                $results += Wait-Job -Name "PODChangeTAHRDC01" | Receive-Job
                $results += Wait-Job -Name "PODChangeTAHRDC02" | Receive-Job
                $results += Wait-Job -Name "PODChangeTAHRDC03" | Receive-Job
                $results += Wait-Job -Name "PODChangeHWHRDC01" | Receive-Job
                $results += Wait-Job -Name "PODChangeHWHRDC02" | Receive-Job
                $results += Wait-Job -Name "PODChangeHWHRDC03" | Receive-Job
                $results += Wait-Job -Name "PODChangeSGFBDC01" | Receive-Job
                $results += Wait-Job -Name "PODChangeSGFBDC02" | Receive-Job
                $results += Wait-Job -Name "PODChangeSGHWDC00" | Receive-Job
                $results += Wait-Job -Name "PODChangeSGTADC00" | Receive-Job
                Remove-Job -Name "PODChangeTAHRDC01"
                Remove-Job -Name "PODChangeTAHRDC02"
                Remove-Job -Name "PODChangeTAHRDC03"
                Remove-Job -Name "PODChangeHWHRDC01"
                Remove-Job -Name "PODChangeHWHRDC02"
                Remove-Job -Name "PODChangeHWHRDC03"
                Remove-Job -Name "PODChangeSGFBDC01"
                Remove-Job -Name "PODChangeSGFBDC02"
                Remove-Job -Name "PODChangeSGHWDC00"
                Remove-Job -Name "PODChangeSGTADC00"
                
                $reset = $global:username + " needed a password reset. Reset " + $global:username + "'s Password`r`n"
                Add-Content -Path c:\PUTWH.txt -Value $reset
                
                
                $resultsTextBox.Text += $results
                

        }
        'Cancel'{$resultsTextBox.Text = "Password Not Changed"}
    }
  }
  'No' {$resultsTextBox.Text = "Password Not Changed"}
  'Cancel' {$resultsTextBox.Text = "Password Not Changed"}
}



}
})

<# Clears the Text Bar and the Results Window#>
$clearButton.Add_Click({
clearwork
$basicTextBox.Text = ""
$resultsTextBox.Text = ""
})

<# Sets account to expired#>
$expiredButton.Add_Click({

actcheck
clearwork
if ($verified -eq "YES"){

$msgBoxInput =  [System.Windows.Forms.MessageBox]::Show("Are you sure you want to set users password to expired?",'Are you sure?','YesNoCancel')

switch  ($msgBoxInput) {
  'Yes' {
$resultsTextBox.Text = "User is " + $global:username + " `r`nPayroll is " + $global:employeenumber
start-job -Name "setExpiredTAHR-SHR-DC01" {

param([string]$username)

Get-ADUser -Identity $username -Server TAHR-SHR-DC01 | Set-ADUser -ChangePasswordAtLogon:$true
$results = "`r`nSet password to expired on TAHR-SHR-DC01" 
return $results
} -ArgumentList $username
start-job -Name "setExpiredTAHR-SHR-DC02" {

param([string]$username)

Get-ADUser -Identity $username -Server TAHR-SHR-DC02 | Set-ADUser -ChangePasswordAtLogon:$true
$results = "`r`nSet password to expired on TAHR-SHR-DC02" 
return $results
} -ArgumentList $username
start-job -Name "setExpiredTAHR-SHR-DC03" {

param([string]$username)

Get-ADUser -Identity $username -Server TAHR-SHR-DC03 | Set-ADUser -ChangePasswordAtLogon:$true
$results = "`r`nSet password to expired on TAHR-SHR-DC03" 
return $results
} -ArgumentList $username
start-job -Name "setExpiredHWHR-SHR-DC01" {

param([string]$username)

Get-ADUser -Identity $username -Server HWHR-SHR-DC01 | Set-ADUser -ChangePasswordAtLogon:$true
$results = "`r`nSet password to expired on HWHR-SHR-DC01" 
return $results
} -ArgumentList $username
start-job -Name "setExpiredHWHR-SHR-DC02" {

param([string]$username)

Get-ADUser -Identity $username -Server HWHR-SHR-DC02 | Set-ADUser -ChangePasswordAtLogon:$true
$results = "`r`nSet password to expired on HWHR-SHR-DC02" 
return $results
} -ArgumentList $username
start-job -Name "setExpiredHWHR-SHR-DC03" {

param([string]$username)

Get-ADUser -Identity $username -Server HWHR-SHR-DC03 | Set-ADUser -ChangePasswordAtLogon:$true
$results = "`r`nSet password to expired on HWHR-SHR-DC03" 
return $results
} -ArgumentList $username
start-job -Name "setExpiredSGFB-SHR-DC01" {

param([string]$username)

Get-ADUser -Identity $username -Server SGFB-SHR-DC01 | Set-ADUser -ChangePasswordAtLogon:$true
$results = "`r`nSet password to expired on SGFB-SHR-DC01" 
return $results
} -ArgumentList $username
start-job -Name "setExpiredSGFB-SHR-DC02" {

param([string]$username)

Get-ADUser -Identity $username -Server SGFB-SHR-DC02 | Set-ADUser -ChangePasswordAtLogon:$true
$results = "`r`nSet password to expired on SGFB-SHR-DC02" 
return $results
} -ArgumentList $username
start-job -Name "setExpiredSGHW-SHR-DC00" {

param([string]$username)

Get-ADUser -Identity $username -Server SGHW-SHR-DC00 | Set-ADUser -ChangePasswordAtLogon:$true
$results = "`r`nSet password to expired on SGHW-SHR-DC00" 
return $results
} -ArgumentList $username
start-job -Name "setExpiredSGTA-SHR-DC00" {

param([string]$username)

Get-ADUser -Identity $username -Server SGTA-SHR-DC00 | Set-ADUser -ChangePasswordAtLogon:$true
$results = "`r`nSet password to expired on SGTA-SHR-DC00" 
return $results
} -ArgumentList $username

$results += Wait-Job -Name "setExpiredTAHR-SHR-DC01" | Receive-Job
$results += Wait-Job -Name "setExpiredTAHR-SHR-DC02" | Receive-Job
$results += Wait-Job -Name "setExpiredTAHR-SHR-DC03" | Receive-Job
$results += Wait-Job -Name "setExpiredHWHR-SHR-DC01" | Receive-Job
$results += Wait-Job -Name "setExpiredHWHR-SHR-DC02" | Receive-Job
$results += Wait-Job -Name "setExpiredHWHR-SHR-DC03" | Receive-Job
$results += Wait-Job -Name "setExpiredSGFB-SHR-DC01" | Receive-Job
$results += Wait-Job -Name "setExpiredSGFB-SHR-DC02" | Receive-Job
$results += Wait-Job -Name "setExpiredSGHW-SHR-DC00" | Receive-Job
$results += Wait-Job -Name "setExpiredSGTA-SHR-DC00" | Receive-Job
Remove-Job -Name "setExpiredTAHR-SHR-DC01"
Remove-Job -Name "setExpiredTAHR-SHR-DC02"
Remove-Job -Name "setExpiredTAHR-SHR-DC03"
Remove-Job -Name "setExpiredHWHR-SHR-DC01"
Remove-Job -Name "setExpiredHWHR-SHR-DC02"
Remove-Job -Name "setExpiredHWHR-SHR-DC03"
Remove-Job -Name "setExpiredSGFB-SHR-DC01"
Remove-Job -Name "setExpiredSGFB-SHR-DC02"
Remove-Job -Name "setExpiredSGHW-SHR-DC00"
Remove-Job -Name "setExpiredSGTA-SHR-DC00"

$resultsTextBox.Text = $results
  }
  'No' {$resultsTextBox.Text = "Password Not Changed"}
  'Cancel' {$resultsTextBox.Text = "Password Not Changed"}
}



}})

<# Clears the history of password changes and account unlocks#>
$clearhistoryButton.Add_Click({
    $msgBoxInput =  [System.Windows.Forms.MessageBox]::Show("Are you sure you want to clear password reset and unlock history?",'Are you sure?','YesNoCancel')
    switch  ($msgBoxInput) {
  'Yes' {
    Clear-Variable $global:unlockedusers
    Clear-Variable $global:pwchangeusers
    Clear-Variable $global:history
    Remove-Item C:\PUTWH.txt
    clearwork

  }
  'No' {$resultsTextBox.Text = "History not cleared."}
  'Cancel' {$resultsTextBox.Text = "History not cleared."}
}
})

<#Searches AD to find a computer with the input text in the name#>
$checkpcButton.Add_Click({

$verified = "NO"
$resultsTextBox.Text = "Please Wait..."
$initialinput=$basicTextBox.Text

if ($initialinput -ne "") {
    $verified = "YES"
}
else {
    $resultsTextBox.Text = "Invalid Entry Try Again"
}

if ($verified -eq "YES"){
    $pcnumberin = $initialinput.Trim()
    $pcnumber = Get-ADComputer -LDAPFilter "(name=*$pcnumberin*)" -SearchBase "OU=TAHR,DC=seminolehardrock,DC=fl,DC=local" | Select-Object -ExpandProperty Name

    if ($pcnumber -eq $Null) {
        $resultsTextBox.Text = "Results Not Found"
    }else {
        foreach ($computer in $pcnumber) {
            $pclist += $computer -join "`r`n" | Out-String   
        }
        $resultsTextBox.Text = $pclist
    }
}
})

<#Checks to see when the password was last set across multiple servers to see if changes have synced#>
$checksyncButton.Add_Click({

actcheck  
clearwork
if ($verified -eq "YES"){   
$resultsTextBox.Text += "`r`nPassword Last Changed (TAHR-SHR-DC01): "
$resultsTextBox.Text += Get-ADUser -identity $username -properties passwordlastset -Server TAHR-SHR-DC01 | Select-Object -ExpandProperty PasswordLastSet
$resultsTextBox.Text += "`r`nPassword Last Changed (TAHR-SHR-DC02): "
$resultsTextBox.Text += Get-ADUser -identity $username -properties passwordlastset -Server TAHR-SHR-DC02 | Select-Object -ExpandProperty PasswordLastSet
$resultsTextBox.Text += "`r`nPassword Last Changed (TAHR-SHR-DC03): "
$resultsTextBox.Text += Get-ADUser -identity $username -properties passwordlastset -Server TAHR-SHR-DC03 | Select-Object -ExpandProperty PasswordLastSet
$resultsTextBox.Text += "`r`nPassword Last Changed (HWHR-SHR-DC01): "
$resultsTextBox.Text += Get-ADUser -identity $username -properties passwordlastset -Server HWHR-SHR-DC01 | Select-Object -ExpandProperty PasswordLastSet
$resultsTextBox.Text += "`r`nPassword Last Changed (HWHR-SHR-DC02): "
$resultsTextBox.Text += Get-ADUser -identity $username -properties passwordlastset -Server HWHR-SHR-DC02 | Select-Object -ExpandProperty PasswordLastSet
$resultsTextBox.Text += "`r`nPassword Last Changed (HWHR-SHR-DC03): "
$resultsTextBox.Text += Get-ADUser -identity $username -properties passwordlastset -Server HWHR-SHR-DC03 | Select-Object -ExpandProperty PasswordLastSet
$resultsTextBox.Text += "`r`nPassword Last Changed (SGFB-SHR-DC01): "
$resultsTextBox.Text += Get-ADUser -identity $username -properties passwordlastset -Server SGFB-SHR-DC01 | Select-Object -ExpandProperty PasswordLastSet
$resultsTextBox.Text += "`r`nPassword Last Changed (SGFB-SHR-DC02): "
$resultsTextBox.Text += Get-ADUser -identity $username -properties passwordlastset -Server SGFB-SHR-DC02 | Select-Object -ExpandProperty PasswordLastSet
$resultsTextBox.Text += "`r`nPassword Last Changed (SGHW-SHR-DC00): "
$resultsTextBox.Text += Get-ADUser -identity $username -properties passwordlastset -Server SGHW-SHR-DC00 | Select-Object -ExpandProperty PasswordLastSet
$resultsTextBox.Text += "`r`nPassword Last Changed (SGTA-SHR-DC00): "
$resultsTextBox.Text += Get-ADUser -identity $username -properties passwordlastset -Server SGTA-SHR-DC00 | Select-Object -ExpandProperty PasswordLastSet
}

})

[void] $basicForm.ShowDialog()





