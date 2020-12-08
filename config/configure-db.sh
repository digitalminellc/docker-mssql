#!/bin/bash

# give SQL Server a few seconds to warm up
sleep 15

HR="===================================================================================================="

echo "$HR
Initializing configuration scripts ..."

# Wait 60 seconds for SQL Server to start up by ensuring that 
# calling SQLCMD does not return an error code, which will ensure that sqlcmd is accessible
# and that system and user databases return "0" which means all databases are in an "online" state
# https://docs.microsoft.com/en-us/sql/relational-databases/system-catalog-views/sys-databases-transact-sql?view=sql-server-2017 
function init() {
	local dbstate=1
	local errcode=1
	local i=0

	while [[ $dbstate -ne 0 && $i -lt 60 && $errcode -ne 0 ]]; do
		i=$i+1
		dbstate=$(/opt/mssql-tools/bin/sqlcmd -h -1 -t 1 -U sa -P $SA_PASSWORD -Q "SET NOCOUNT ON; Select SUM(state) from sys.databases")
		errcode=$?
		sleep 1
	done

	echo "$errcode"
}

ERRCODE="$(init)"

if [ $ERRCODE -ne 0 ]; then 
	echo "$HR
	ERROR: $ERRCODE"
	exit 1
fi

echo "$HR
Loading setup.sql ..."

# Run the setup script to create the DB and the schema in the DB
DBRUN=$(/opt/mssql-tools/bin/sqlcmd -S 127.0.0.1 -U sa -P $SA_PASSWORD -d master -i /usr/config/setup.sql)

echo "$HR
MSSQL 2017 is ready ..."
