#!/usr/bin/make -f

nodejs?=nodejs
x_www_browser?=chromium-browser --allow-file-access-from-files
x_www_browser?=x-www-browser

delay?=3

run: 
	make client &
	make stream

server: main.js
	${nodejs} $<

client: client.html
	${x_www_browser} $<

stream: main.js
	while true ; do date -u +"%s" ; sleep ${delay} ; done  | nodejs $< --

setup:
	sudo apt-get install npm nodejs
	npm install websocket
