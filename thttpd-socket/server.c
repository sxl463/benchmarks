/**
 * Example echo server
 *
 * This is the server script
 */
//#include <sys/stat.h> 
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "socket.h"
#include "libhttpd.h"

int main()
{
    char buf[1000];
    int bytes;
    
    // Instantiate a socket object
    Socket *s = init_socket(AF_INET, SOCK_STREAM);

    int option = 1;
    setsockopt(s->_sockfd, SOL_SOCKET, SO_REUSEADDR, &option, sizeof(option));


    // Bind the socket to localhost on port 12345
    // To bind to a specific IP, replace NULL with the IP address,
    // for example: "192.168.1.123"
    s->bind(s, NULL, 12345);
    
    // Listen and allow up to five queued clients
    s->listen(s, 5);
    
    // Define a client address structure to get info about the connected client
    ClientAddr client_addr;
    
    // Accept clients
    Socket *c = s->accept(s, &client_addr);
    
    printf("Client connected at %s:%d\n", client_addr.ip_addr, client_addr.port);
    
    while (1) {
        memset(buf, 0, sizeof(buf));
        //c->recv(c, buf, sizeof(buf));
        recv(c->_sockfd, buf, sizeof(buf), 0);
	printf("sizeof(buf): %d\n", sizeof(buf));
        if (strlen(buf) == 0) {
	  printf("Empty packet reveived!\n");  
          break;
        }
	char* pCur = buf;


	for (int i = 0;i < sizeof(buf); i++){
	printf("%x ", buf[i]);
	}
	printf("\n");
	
	int len1;
	memcpy(&len1, pCur, sizeof(int));
	pCur += sizeof(int);
	
	shttpd_conn sc; 	
	memcpy(sc.str1, pCur, len1);
	printf("sc.str1: %s\n", sc.str1);
	pCur += len1;

	int len2;
	memcpy(&len2, pCur, sizeof(int));
	pCur += sizeof(int);
	printf("len2: %d\n", len2);	

	memcpy(sc.str2, pCur, len2);
	pCur += len2;
	printf("sc.str2: %s\n", sc.str2);

	
	printf("============ send back to thttpd(client) ===============\n");

	char backbuf[1000];
	memset(backbuf, 0, sizeof(backbuf));
	char *backstr = "reply_by_server";
	memcpy(backbuf, backstr, strlen(backstr));
	printf("backbuf before sending back: %s\n", backbuf);

	send(c->_sockfd, backbuf, strlen(backstr), 0);
	printf("sent backbuf back.\n");



//	break;


/*
        printf("Got: %s\n", buff);

	printf("Here is the message:n\n");
	for (int i = 0; i < 1000; i++)
	{
    		printf("%c", buff[i]);
	}

	printf("src1: %s\n", sc->str1);
	printf("src2: %s\n", sc->str2);
*/

//	break;
 //       c->send(c, buff);
//        printf("Sending: %s\n", buff);
    }
    
    // Destroy the client socket object
    socket_close(c);
    
    // Destory the main socket object
    socket_close(s);
}
