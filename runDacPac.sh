export PATH="/Users/adeelmalik/Downloads/sqlpackage":$PATH

# export PGPASSWORD=secret
# psql -h localhost -U postgres --command "\COPY table1 FROM PROGRAM 'gzip -dc data.csv.gz' DELIMITER ',' CSV HEADER; "

echo param1=${1}

source ${1}

# psql -h ${HOSTNAME} -U ${PGUSERNAME} --command "\COPY table1 FROM PROGRAM 'gzip -dc data.csv.gz' DELIMITER ',' CSV HEADER; "

# sudo spctl --master-disable

sqlpackage \
    /SourceFile:"${DACPAC_SOURCEFILE}" \
    /Action:Publish \
    /TargetServerName:"${SQL_HOSTNAME}" \
    /TargetTrustServerCertificate:true \
    /TargetDatabaseName:"${SQL_DATABASE}" \
    /TargetUser:"${SQL_USERNAME}" \
    /TargetPassword:"${SQL_PASSWORD}"

# sudo spctl --master-enable