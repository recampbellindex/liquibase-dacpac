# Deploy DACPAC using Liquibase

This repository demonstrates how to deploy MS SQL Server's DACPAC files using Liquibase

## Prerequisites

* Download and install `sqlpackage`
    * [Link](https://learn.microsoft.com/en-us/sql/tools/sqlpackage/sqlpackage-download?view=sql-server-ver16)

## Liquibase Setup

DACPAC file are deployed using the [executeCommand](https://docs.liquibase.com/change-types/execute-command.html) change type which uses the abovementioned `sqlpackage` executable from Microsoft. 

Example changeset:

```xml
<changeSet author="amalik"  id="runDacPac" runAlways="true" runOnChange="true">  
    <executeCommand  executable="runDacPac.sh"  
            timeout="300s">  
        <arg value="exports.sh"/>
    </executeCommand>  
</changeSet>
```

The `sqlpackage` command is used in the `runDacPac.sh` script as follows. 

```sh
sqlpackage \
    /SourceFile:"<filename>.dacpac" \
    /Action:Publish \
    /TargetServerName:"<hostname>" \
    /TargetTrustServerCertificate:true \
    /TargetDatabaseName:"<database_name>" \
    /TargetUser:"<username>" \
    /TargetPassword:"<password>"
```

This shell script should be marked as executable (`chmod +x runDacPac.sh`) and you should be able to run this script standalone.

To run this script with Liquibase, provide your database connections (see [liquibase.properties] file). 