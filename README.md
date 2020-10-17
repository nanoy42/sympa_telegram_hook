# sympa_telegram_hook
Simple hook to send messages to telegram when a message is received on a list.

Simple script that sends message to a telegram chat when a mail is send to a mailing list.

To use, place in the script directory of Sympa and edit the two constants (token and chat_id).

Then edit the list configuration (sending and receiving setup) :  A hook on the messages just after archiving (post_archive) and put Sympa::Telegram::Hook
