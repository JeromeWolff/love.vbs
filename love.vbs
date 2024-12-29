Function Start()
	IgnoreInfected = MsgBox("Ihr System wurde möglicherweise mit einem Virus infiziert." & vbNewLine & "Um weitere Schritte durchzuführen drücken Sie bitte auf " & """Ja""", vbCritical + vbYesNo + vbSystemModal, "Windows Defender")
	If IgnoreInfected = vbNo Then
		WrappedMessageBox "Wenn Sie den Virus ignorieren, könnte dies Konsequenzen haben." & vbNewLine & "Möchten Sie den Virus dennoch ignorieren?", vbInformation + vbYesNo + vbSystemModal, "Windows Defender"
	End If
	Format
End Function

Function Format()
	WrappedMessageBox "Der Virus hat die Festplatte (C:) infiziert. Um zu verhindern, dass Daten verloren gehen muss (C:) neu formatiert werden." & vbNewLine	& "Wollen Sie (C:) neu formatieren?", vbCritical + vbYesNo + vbSystemModal, "Windows Defender"
	RestartAccepted = MsgBox("ERROR 404 (C:) wurde nicht gefunden. Möchten Sie Ihren PC jetzt neustarten?", vbCritical + vbYesNo + vbSystemModal, "Windows Defender")
	If RestartAccepted = vbYes Then
		WrappedMessageBox "Ihr PC wird automatisch innerhalb der nächsten 5 Sekunden neugestartet.", vbInformation + vbOKOnly + vbSystemModal, "Windows Defender"
	Else If RestartAccepted = vbNo Then
		WrappedMessageBox "Um zu verhindern, dass System 32 gelöscht wird, wird Ihr PC innerhalb von 5 Sekunden neugestartet.", vbInformation + vbOKOnly + vbSystemModal, "Windows Defender"
	End If
End If
	WScript.sleep 5000
	DisplayErrorAction
End Function 

Function DisplayErrorAction()
	RepeatAction = MsgBox("ERROR 500 die Aktion ist fehlgeschlagen. Ihr PC kann nicht neu gestartet werden", vbCritical + vbRetryCancel + vbSystemModal, "Windows Defender")
	If RepeatAction = vbCancel Then
		DisplayErrorAction
	Else If RepeatAction = vbRetry Then
		RepeatRestart
	End If
End If
End Function

Function RepeatRestart()
	WrappedMessageBox "Bitte beantworten Sie nachfolgende Frage wahrheitsgemäß und ehrlich um das Risiko einer Löschung der Dateien zu mindern", vbInformation + vbOK + vbSystemModal, "Sicherheitsabfrage"
	WrappedMessageBox "Will...", vbInformation + vbOKOnly + vbSystemModal, "Ein geheimer Veehrer"
	WrappedMessageBox "you...", vbInformation + vbOKOnly + vbSystemModal, "Ein geheimer Veehrer"
	WrappedMessageBox "be...", vbInformation + vbOKOnly + vbSystemModal, "Ein geheimer Veehrer"
	WillYouBeMyValeintine = MsgBox("my valentine?", vbInformation + vbYesNo + vbSystemModal, "Ein geheimer Verehrer")
	If WillYouBeMyValeintine = vbYes Then
		SheSaidYes
	Else If WillYouBeMyValeintine = vbNo Then
		RickRoll
		LoopMessage
	End IF
End If
End Function

Function SheSaidYes()
	WrappedMessageBox "Meine Liebe... <3", vbInformation + vbOKOnly + vbSystemModal, "Ein geheimer Veehrer"
	WrappedMessageBox "Ich liebe dich über alles <3", vbInformation + vbOKOnly + vbSystemModal, "Ein geheimer Veehrer"
	WrappedMessageBox "Bleib bei mir <3", vbInformation + vbOKOnly + vbSystemModal, "Ein geheimer Veehrer"
	WrappedMessageBox "Ein Leben lang <3", vbInformation + vbOKOnly + vbSystemModal, "Ein geheimer Veehrer"
End Function

Function LoopMessage()
	For index = 0 To 20
		WrappedMessageBox "Ich liebe dich mehr", vbInformation + vbOKOnly, "Ein geheimer Verehrer" 
	Next
End Function

Function RickRoll()
	Set Shell = WScript.CreateObject("WScript.Shell")
	Shell.Run "firefox.exe https://www.youtube.com/watch?v=uHgt8giw1LY"
End Function

Function WrappedMessageBox(message, modal, title)
	Result = MsgBox(message, modal, title)
	If Result = vbCancel Or Result = vbAbort Then
		WrappedMessageBox message, modal, title
	End If
End Function

Start
