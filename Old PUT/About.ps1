<# About Form Popup#>


[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")  
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms") 
[void] [System.Windows.Forms.Application]::EnableVisualStyles() 
 



$basicForm = New-Object System.Windows.Forms.Form
    $basicForm.Text = "P.U.T. Version: 6.13.0"
    $basicForm.Size = New-Object System.Drawing.Size(560,550)
    $basicForm.FormBorderStyle = "FixedSingle"
    $basicForm.MaximizeBox = $false
    $basicForm.MinimizeBox = $false
    $basicForm.Icon = New-Object system.drawing.icon '.\icon.ico'


$pictureBox = new-object Windows.Forms.PictureBox 
    $art = [system.drawing.image]::FromFile(".\ART2.png")
    $pictureBox.AutoSize = $True
    $pictureBox.Image=$art
    $pictureBox.Location = "5,0"

$lineLabel = New-Object System.Windows.Forms.Label
    $lineLabel.Location = "0,90"
    $lineLabel.Size = "560,2"
    $lineLabel.BorderStyle = "Fixed3D"

$lineLabel2 = New-Object System.Windows.Forms.Label
    $lineLabel2.Location = "0,250"
    $lineLabel2.Size = "560,2"
    $lineLabel2.BorderStyle = "Fixed3D"

$toplabel = New-Object System.Windows.Forms.Label  
    $toplabel.AutoSize = $true 
    $toplabel.Location = New-Object System.Drawing.Size(5,100)

$toplabel.Text = "Powershell Utility Toolkit`n`nVersion: 6.13.0 `n`nCreated: 07/29/20 `n`nModified: 12/25/20 `n`nAuthor: Eric Butler `n`nFor Feature Requests or Feedback Reach out at eric.butler@seminolehardrock.com"

$bottomlabel = New-Object System.Windows.Forms.Label  
    $bottomlabel.AutoSize = $true 
    $bottomlabel.Location = New-Object System.Drawing.Size(5,255)


$CLNext = New-Object System.Windows.Forms.Button
    $CLNext.Text = "Next" 
    $CLNext.Location = "390,485"
    $CLNext.Size = "150,23"

$CLPrevious = New-Object System.Windows.Forms.Button
    $CLPrevious.Text = "Previous" 
    $CLPrevious.Location = "5,485"
    $CLPrevious.Size = "150,23"



$CLNext.Add_Click({
    if($global:vcount -lt 4){$global:vcount = $global:vcount + 1}
    $displayedversion = $versionlist[$global:vcount]
    $bottomlabel.Text = $displayedversion
})

$CLPrevious.Add_Click({
    if($global:vcount -gt 0){$global:vcount = $global:vcount - 1}
    $displayedversion = $versionlist[$global:vcount]
    $bottomlabel.Text = $displayedversion
})




$6102 = "
Change Logs: 6.10.2 09/06/20`r
`nAdded:`r
-Change Logs`r
-New Logo`r
`nRemoved:`r
-Old Logo`r
`nChanged:`r
-Changed name from ADCT (Active Directory Convience Tool) to P.U.T. (Powershell Utility Toolkit)
-Revamped the About Page`r
-Work history will now be saved after closing`r
`nBugs:`r
-Work History Will not be saved unless you click work history before closing.`r
"

$6103 = "
Change Logs: 6.10.3 09/10/20`r
`nAdded:`r
-Change Logs Next and Previous buttons`r
-Prompt To Expire Password During Reset
`nRemoved:`r
`nChanged:`r
-About Page`r
`nBugs:`r
-Work History Will not be saved unless you click work history before closing. - FIXED`r
"

$6104 = "
Change Logs: 6.10.4 09/19/20`r
`nAdded:`r
-`"Search for computers`" Button added. Use part of a PCs asset number or computer name and all PCs with similar names will appear!`r
-Scroll Bar on the results page`r
`nRemoved:`r
`nChanged:`r
-Changed the Colors to provide more contrast and better visibility.
-Changed the code behind the about page to support more than 2 change logs.`r
-Added PC lookup information to the `"Account Check`" button.
`nBugs:`r
-PC lookup only shows IP and does not give uptime or name of multiple PCs - FIXED`r
"
$6110 = "
Change Logs: 6.11.0 09/20/20`r
`nAdded:`r
-Auto Complete when typing in a payroll number or username.`r
-Extra Help Buttons to explain the buttons if needed`r
`nRemoved:`r
-Hitting enter no longer automatically starts the account lookup: Done to avoid conflics with selecting an `n`rautofill item.
`nChanged:`r
`nBugs:`r
`r
"
$6120 = "
Change Logs: 6.12.0 10/15/20`r
`nAdded:`r
-Buttons to copy a PC name when using the PC Lookup Button. `r
`nRemoved:`r
-Removed the unlock ticket text and password reset ticket text buttons from main screen.`r
`nChanged:`r
-Code was almost redone to be faster and easier to read/edit (Yay Functions!)`r
-Certain Button now only show after another tool is used. Done in order to clear clutter.`r
`nBugs:`r
`r
"
$6130 = "
Change Logs: 6.13.0 12/25/20`r
`nMerry Christmas!`r
`nAdded:`r
-Sync Check Button. Checks to see if changes made to the account have replicated to the other DCs `r
`nRemoved:`r
-`r
`nChanged:`r
-Password reset button will now unlock the account aswell.`r
`nBugs:`r
`r
"




$versionlist = @($6102,$6103,$6104,$6110,$6120,$6130)
$global:vcount = 5
$displayedversion = $versionlist[$global:vcount]
$bottomlabel.Text = $displayedversion









$basicForm.Controls.Add($toplabel)
$basicForm.Controls.Add($bottomlabel)
$basicForm.Controls.Add($pictureBox)
$basicForm.Controls.Add($lineLabel)
$basicForm.Controls.Add($lineLabel2)
$basicForm.Controls.Add($CLPrevious)
$basicForm.Controls.Add($CLNext)


[void] $basicForm.ShowDialog()




$CLNext.Add_Click({})
$CLPrevious.Add_Click({})