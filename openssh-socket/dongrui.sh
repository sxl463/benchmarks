#!/usr/bin/expect
spawn ./ssh -v dxz16@130.203.32.164

expect "yes/no"
send "yes\n"

expect "*password:"
send "ZdrPsu19920101170\r"
#expect "*#"

#expect "~"  # put here string from your server prompt

interact

