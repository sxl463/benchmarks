#!/bin/sh

llvm-link ssh.o readconf.o clientloop.o sshtty.o sshconnect.o sshconnect1.o sshconnect2.o mux.o -o ssh-only-client.bc

llvm-dis ssh-only-client.bc
