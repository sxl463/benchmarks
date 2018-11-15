#!/bin/sh


# For what : use except to login ssh without passwd
# Author   : Shen
# Date     : 2017/05/14

#Server Config
CONFIGS=(
# format" "ServerName  Port  IP  User  Password"
	"sxl463_localhost 22 127.0.0.1 sxl463 !trump2017maga"
#    "Server Name 22 220.181.57.217 root baidu.com"
#    "sina 22 66.102.251.33 root sina.com"
)

#Server Config Len
CONFIG_LENGTH=${#CONFIGS[*]}  #how many sites
  
#Login Menu
function LoginMenu(){
    
    echo "-------please input server id---------"
    for ((i=0;i<${CONFIG_LENGTH};i++));  
    do  
        CONFIG=(${CONFIGS[$i]}) #assign one dimensional char[] sites to array  
        serverNum=$(($i+1)) 
        echo "---(${serverNum})--${CONFIG[0]}(${CONFIG[2]})---"
    done  
    echo "please input the server id you choose: "
}

#choose server to login
function ChooseServer(){
    
    read serverNum
    if [[ $serverNum -gt $CONFIG_LENGTH ]] ;
    then
        echo "wrong server，please input again:"
        ChooseServer ;
        return ;
    fi
    if [[ $serverNum -lt 1 ]] ;
    then
        echo "wrong server，please input again:"
        ChooseServer ;
        return ;
    fi
 
    AutoLogin $serverNum;
}  

#auto login
function AutoLogin(){
    
    num=$(($1-1)) 
    CONFIG=(${CONFIGS[$num]})  
    echo "loginning ${CONFIG[0]}"
    date +%T:%N
    expect -c "
        spawn ssh -v ${CONFIG[1]} ${CONFIG[3]}@${CONFIG[2]}
        expect {
            \"*assword\" {set timeout 30; send \"${CONFIG[4]}\n\"; exp_continue ; sleep 3; }
            \"yes/no\" {send \"yes\n\"; exp_continue;}
            \"Last*\" {  send_user \"\n login succesfully ${CONFIG[0]} \n\";}
        }
	       
   interact"
   echo "You already logout ${CONFIG[0]}"
    
}

LoginMenu ;
ChooseServer ;
