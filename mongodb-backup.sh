#!/bin/bash
timestamp="`date +%Y-%m-%d-%H%M`"
dbname="geoffrey"
backupfile="db-${dbname}-${timestamp}.gz"
echo "Backup database ${dbname} to file ${backupfile}"
mongodump --archive=$backupfile --gzip --username=admin --authenticationDatabase=admin --dumpDbUsersAndRoles --db=$dbname
