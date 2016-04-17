#!/bin/bash
dbname="geoffrey"
backupfile=$1
echo "Restore database ${dbname} from file ${backupfile}"
mongorestore --archive=$backupfile --gzip --username=admin --authenticationDatabase=admin --drop --restoreDbUsersAndRoles --db=$dbname