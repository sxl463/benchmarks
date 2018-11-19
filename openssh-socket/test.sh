#!/usr/bin/expect
spawn ./ssh -v sxl463@127.0.0.1

expect "yes/no"
send "yes\n"

expect "*password:"
send "!trump2017maga\r"
#expect "*#"

#expect "~"  # put here string from your server prompt

interact

