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

## Developer Experience

For developers wanting to deploy their DACPAC files using Liquibase, they will need to provide the DACPAC file name in the [exports.sh](exports.sh) file, along with other information such as the server name, database, username and password.

If implementing with CICD tools, you may want to use these Liquibase environment variables for username and password in your [exports.sh](exports.sh) script:
* `LIQUIBASE_COMMAND_USERNAME`
* `LIQUIBASE_COMMAND_PASSWORD`

Also note that Liquibase environment variable `LIQUIBASE_COMMAND_URL` is not compatible with `SQL_HOSTNAME` environment variable which is used in /TargetServerName argument of `sqlpackage`. As a result, you will need to specify SQL_HOSTNAME separately if you are also providing `LIQUIBASE_COMMAND_URL`. 

## Deploy using Liquibase

To run this script with Liquibase:

1. Provide your database connections (see [liquibase.properties](liquibase.properties) file). 
1. Run `liquibase update` command
