#!/bin/sh
echo "running pin..."
#openssh-7.4p1/ssh(gcc) is different from openssh-new/ssh(clang, sshkey_parse_private2 can be found)

# case 1: normal login, key auth
# ssh-1-login-succeed.txt
#/home/sxl463/pin-3.6-gcc-linux/pin -t /home/sxl463/pin-3.6-gcc-linux/source/tools/ManualExamples/obj-intel64/funcgvrelation.so -o ssh-1-common-login.pinout -- ~/working/security-programs/openssh-7.4p1/ssh sxl463@130.203.32.165

#/home/sxl463/pin-3.6-gcc-linux/pin -t /home/sxl463/pin-3.6-gcc-linux/source/tools/ManualExamples/obj-intel64/funcgvrelation.so -o ssh.pinout -- ~/working/security-programs/openssh-new/ssh sxl463@130.203.32.165

# case 2: login with wrong ip, key auth first, failed to input passwd 3 times

/home/sxl463/pin-3.6-gcc-linux/pin -t /home/sxl463/pin-3.6-gcc-linux/source/tools/ManualExamples/obj-intel64/funcgvrelation.so -o ssh.pinout -- ~/working/security-programs/openssh-new/ssh sxl463@130.203.32.160

# case 3: login with wrong username, rsa key auth first, failed 3 times

#/home/sxl463/pin-3.6-gcc-linux/pin -t /home/sxl463/pin-3.6-gcc-linux/source/tools/ManualExamples/obj-intel64/funcgvrelation.so -o ssh.pinout -- ~/working/security-programs/openssh-new/ssh wrong@130.203.32.165

# case 4: remove id_rsa, when ssh can't find it, it will enable password auth
# to log in, and password auth succeeds(just one successful try).

#echo "remove id_rsa private key"
#/home/sxl463/pin-3.6-gcc-linux/pin -t /home/sxl463/pin-3.6-gcc-linux/source/tools/ManualExamples/obj-intel64/callrelation3.so -o ssh-4-private-key-file-not-found.txt -- ~/working/security-programs/openssh-7.4p1/ssh sxl463@130.203.32.165

#/home/sxl463/pin-3.6-gcc-linux/pin -t /home/sxl463/pin-3.6-gcc-linux/source/tools/ManualExamples/obj-intel64/funcgvrelation.so -o ssh.pinout -- ~/working/security-programs/openssh-new/ssh sxl463@130.203.32.165


# case 5: enable option "-v", other config still the same
#/home/sxl463/pin-3.6-gcc-linux/pin -t /home/sxl463/pin-3.6-gcc-linux/source/tools/ManualExamples/obj-intel64/callrelation3.so -o ssh.pinout -- ~/working/security-programs/openssh-7.4p1/ssh -v sxl463@130.203.32.165

#echo "verbose mode -v"
#/home/sxl463/pin-3.6-gcc-linux/pin -t /home/sxl463/pin-3.6-gcc-linux/source/tools/ManualExamples/obj-intel64/funcgvrelation.so -o ssh.pinout -- ~/working/security-programs/openssh-new/ssh -v sxl463@130.203.32.165

#case 6: normal rsa key auth
#/home/sxl463/pin-3.6-gcc-linux/pin -t /home/sxl463/pin-3.6-gcc-linux/source/tools/ManualExamples/obj-intel64/funcgvrelation.so -o ssh.pinout -- ~/working/security-programs/openssh-new/ssh sxl463@130.203.32.165
