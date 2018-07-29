#!/bin/bash

#DEFAULT_HOST=localhost
DEFAULT_USER=root
DEFAULT_DB=test

cd $WORK_DIR

if [ "$MYSQL_HOST" = "" ]; then
	echo "MYSQL_HOST env not specified."
	exit
fi

if [ "$MYSQL_USER" = "" ]; then
	echo "MYSQL_USER env not specified. use default user '$DEFAULT_USER'"
	MYSQL_USER=$DEFAULT_USER
fi

if [ "$MYSQL_DB" = "" ]; then
	echo "MYSQL_DB env not specified. use default db '$DEFAULT_DB'"
	MYSQL_DB=$DEFAULT_DB
fi

export LC_ALL=C.UTF-8
export LANG=C.UTF-8

mycli --host $MYSQL_HOST --user $MYSQL_USER $MYSQL_DB

