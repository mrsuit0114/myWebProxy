# Makefile for Proxy Lab 
#
# You may modify this file any way you like (except for the handin
# rule). You instructor will type "make" on your specific Makefile to
# build your proxy from sources.

CC = gcc
CFLAGS = -g -Wall
LDFLAGS = -lpthread

# all: proxy
all: echo_client echo_server


# 에코서버 테스트------------------------------------------------------
echo_client: echoclient.c csapp.o   #재료 -o 실행파일 이름..  재료 나열.. 목적파일만 있어야하는거아님?
	$(CC) $(CFLAGS) -o echo_client echoclient.c csapp.o $(LDFLAGS)  
echo_server: echoserver.c csapp.o
	$(CC) $(CFLAGS) -o echo_server echoserver.c csapp.o $(LDFLAGS)
csapp.o: csapp.c
	$(CC) $(CFLAGS) -c csapp.c
# 에코서버 테스트------------------------------------------------------


csapp.o: csapp.c csapp.h
	$(CC) $(CFLAGS) -c csapp.c

proxy.o: proxy.c csapp.h
	$(CC) $(CFLAGS) -c proxy.c

proxy: proxy.o csapp.o
	$(CC) $(CFLAGS) proxy.o csapp.o -o proxy $(LDFLAGS)

# Creates a tarball in ../proxylab-handin.tar that you can then
# hand in. DO NOT MODIFY THIS!
handin:
	(make clean; cd ..; tar cvf $(USER)-proxylab-handin.tar proxylab-handout --exclude tiny --exclude nop-server.py --exclude proxy --exclude driver.sh --exclude port-for-user.pl --exclude free-port.sh --exclude ".*")

clean:
	rm -f *~ *.o proxy core *.tar *.zip *.gzip *.bzip *.gz

