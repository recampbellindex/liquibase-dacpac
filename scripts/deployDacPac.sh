echo exports=${1}
cat ${1}
source ${1}

# sudo spctl --master-disable

sqlpackage \
    /SourceFile:"${DACPAC_SOURCEFILE}" \
    /Action:Publish \
    /TargetServerName:"${SQL_TARGETSERVERNAME}" \
    /TargetTrustServerCertificate:true \
    /TargetDatabaseName:"${SQL_TARGETDATABASE}" \
    /TargetUser:"${SQL_TARGETUSERNAME}" \
    /TargetPassword:"${SQL_TARGETPASSWORD}"

# sudo spctl --master-enable