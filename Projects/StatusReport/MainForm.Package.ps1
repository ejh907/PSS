﻿#------------------------------------------------------------------------
# Source File Information (DO NOT MODIFY)
# Source ID: 6f7aacd1-a483-4535-9581-7eeb82209525
# Source File: C:\Users\ehendricks\Documents\SAPIEN\PowerShell Studio\Projects\StatusReport\MainForm.psf
#------------------------------------------------------------------------
#region File Recovery Data (DO NOT MODIFY)
<#RecoveryData:
NgsAAB+LCAAAAAAABAC9Vl1v2jAUfZ+0/2DlYU8RIaQU0CBSgVWaCqWCrttb5TgX8OrYyHZasl8/
m5B+AUuY2ioSipNzfO71PfeS7hSIuAeZDbHGyNwoKnjPadR8J/z8CaHuRNIF5ZidUwaXOIFwjCk/
FzKprdS86+28zknRbyAa6WwFPWeWKQ1J7SflsXhQNcvNf12075WLbrZRnNTq9nLRIGU6ldDjkGqJ
mYuu0ohRcgHZtbgD3otaLdwkzVO/E5xAvd1xEDehGGWNdapup7ASUjuILCmLpcE7A8G1FEzlOZqA
r6RYgdTZlnhGCKx0P9Va8AJjUFOYg+ET2MKiDWBy4SCv2Mgrdjq0c6rFjGAGQ5oAt2maIE5d5AfV
qWMRgxOemxxKOQNGgesZ/WMIp+2Gi4KgXMiWoS9kDHKmM2al6BriIcVMLErJY7ymidHri7UhYqag
nEL5sRRrNSd8Ud9SjkFLfSUU1dRWdWAOxmRIJAAv5V7DWhd66JDet3uz5ZYwEjh+FeCtfdb1NqiC
Ut4oIxwBe/dOYVbF/1eLHPDjxlnXMt0t2S5hJAjOz943TuxUYORlzoOrAM+jCZp722lPUXH0ncdg
TNeogt5YoHIsFn7G6MJk2xdmTCQjmO/xjJc7oLof8qH07oZ4Gm1HWYKTpZBFxi6a0sVyN+ldXj5b
pqBMtE44uTjKTM2OKXij067spyK3yo5qWYHjHFWv7KgvOFl9rRTMDwU3VKWYbcZyH5O7gWD2uA/1
3/OBZP4JyN1T7reb9atp9NyMLxdnSkFijAOqwG6fZGGiiJCMRm9gvq73uOtrldzuH6Hx5i1Vrmi/
vT5GSOIHyhf/o1UP5s15a+77cbOOA1yu9SthH5LTQEh4e6HHZW75rvf8Ozn8C92b8+A2CwAA#>
#endregion

<#
    .NOTES
    --------------------------------------------------------------------------------
     Code generated by:  SAPIEN Technologies, Inc., PowerShell Studio 2017 v5.4.140
     Generated on:       6/11/2017 2:58 PM
     Generated by:       EHendricks
    --------------------------------------------------------------------------------
    .DESCRIPTION
        GUI script generated by PowerShell Studio 2017
#>


#----------------------------------------------
#region Application Functions
#----------------------------------------------

#endregion Application Functions

#----------------------------------------------
# Generated Form Function
#----------------------------------------------
function Show-MainForm_psf {

	#----------------------------------------------
	#region Import the Assemblies
	#----------------------------------------------
	[void][reflection.assembly]::Load('System.Windows.Forms, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
	[void][reflection.assembly]::Load('System.Drawing, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
	#endregion Import Assemblies

	#----------------------------------------------
	#region Generated Form Objects
	#----------------------------------------------
	[System.Windows.Forms.Application]::EnableVisualStyles()
	$Status_Report = New-Object 'System.Windows.Forms.Form'
	$label1 = New-Object 'System.Windows.Forms.Label'
	$buttonOK = New-Object 'System.Windows.Forms.Button'
	$InitialFormWindowState = New-Object 'System.Windows.Forms.FormWindowState'
	#endregion Generated Form Objects

	#----------------------------------------------
	# User Generated Script
	#----------------------------------------------
	
	$Status_Report_Load={
		#Personal Email Count
		$statusreport = "Good morning. `n `n"
		$outlook = new-object -com Outlook.Application -ErrorAction Stop
		$session = $outlook.Session
		$session.Logon()
		$inbox = $outlook.session.GetDefaultFolder(6)
		$unreadCount = (%{ $inbox.Items | Where-Object { $_.UnRead } }).Count
		Get-Process *Outlook* | Stop-Process
		$statusreport = $statusreport += "You have $unreadCount unread emails in your personal account. `n"
		
		#Helpdesk email account
		
		#Test Important Servers
		$servers = @(
			"pgoadcp01",
			"ancentp01",
			"pgofilp02",
			"pgosqlp03",
			"TestBadServer"
					)
		
		$GoodConnection = @()
		$BadConnection = @()
		
		foreach ($server in $servers)
		{
			($Success = Test-Connection $server -Count 1)
			If ($Success) { $GoodConnection += "$Server" + ', ' }
			Else { $FailedConnection = "$Server" + ', ' }
		}
		
		If ($FailedConnection) {$StatusReport += "The following servers did not respond to pings: $FailedConnection `n"}
		If ($GoodConnection) { $StatusReport += "The following servers successfully responded to pings: $GoodConnection `n" }
		
		$statusreport += "`n"
		$statusreport += "`n"
		$statusreport += "I will now open your daily programs."
		
		$label1.Text = $statusreport
		
	}
	
	$buttonOK_Click={
		#TODO: Place custom script here
		& 'C:\Program Files (x86)\Microsoft Office\Office15\Outlook.exe'
		& 'C:\Users\ehendricks\AppData\Local\slack\slack.exe'
		& 'C:\Program Files (x86)\ASG-Remote Desktop 2016\ASGRD.exe'
		& "PowerShell_ISE.exe"
		start-Process 'http://confluence.smmpogo.loc:8090/'
		Return
	}
	
	# --End User Generated Script--
	#----------------------------------------------
	#region Generated Events
	#----------------------------------------------
	
	$Form_StateCorrection_Load=
	{
		#Correct the initial state of the form to prevent the .Net maximized form issue
		$Status_Report.WindowState = $InitialFormWindowState
	}
	
	$Form_Cleanup_FormClosed=
	{
		#Remove all event handlers from the controls
		try
		{
			$buttonOK.remove_Click($buttonOK_Click)
			$Status_Report.remove_Load($Status_Report_Load)
			$Status_Report.remove_Load($Form_StateCorrection_Load)
			$Status_Report.remove_FormClosed($Form_Cleanup_FormClosed)
		}
		catch { Out-Null <# Prevent PSScriptAnalyzer warning #> }
	}
	#endregion Generated Events

	#----------------------------------------------
	#region Generated Form Code
	#----------------------------------------------
	$Status_Report.SuspendLayout()
	#
	# Status_Report
	#
	$Status_Report.Controls.Add($label1)
	$Status_Report.Controls.Add($buttonOK)
	$Status_Report.AcceptButton = $buttonOK
	$Status_Report.AutoScaleDimensions = '6, 13'
	$Status_Report.AutoScaleMode = 'Font'
	$Status_Report.ClientSize = '682, 333'
	$Status_Report.FormBorderStyle = 'FixedDialog'
	$Status_Report.MaximizeBox = $False
	$Status_Report.MinimizeBox = $False
	$Status_Report.Name = 'Status_Report'
	$Status_Report.StartPosition = 'CenterScreen'
	$Status_Report.Text = 'Status Report'
	$Status_Report.add_Load($Status_Report_Load)
	#
	# label1
	#
	$label1.AutoSize = $True
	$label1.Location = '12, 9'
	$label1.Name = 'label1'
	$label1.Size = '35, 13'
	$label1.TabIndex = 2
	$label1.Text = 'label1'
	$label1.TextAlign = 'BottomLeft'
	#
	# buttonOK
	#
	$buttonOK.Anchor = 'Bottom, Right'
	$buttonOK.DialogResult = 'OK'
	$buttonOK.Location = '595, 298'
	$buttonOK.Name = 'buttonOK'
	$buttonOK.Size = '75, 23'
	$buttonOK.TabIndex = 0
	$buttonOK.Text = '&OK'
	$buttonOK.UseVisualStyleBackColor = $True
	$buttonOK.add_Click($buttonOK_Click)
	$Status_Report.ResumeLayout()
	#endregion Generated Form Code

	#----------------------------------------------

	#Save the initial state of the form
	$InitialFormWindowState = $Status_Report.WindowState
	#Init the OnLoad event to correct the initial state of the form
	$Status_Report.add_Load($Form_StateCorrection_Load)
	#Clean up the control events
	$Status_Report.add_FormClosed($Form_Cleanup_FormClosed)
	#Show the Form
	return $Status_Report.ShowDialog()

} #End Function

#Call the form
Show-MainForm_psf | Out-Null