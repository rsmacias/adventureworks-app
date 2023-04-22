# New SDK-style SQL project with Microsoft.Build.Sql

For more details about this new style, please visit the following links:
- [DacFx project](https://github.com/microsoft/DacFx)
- [Microsoft.Build.Sql](https://github.com/microsoft/DacFx/tree/main/src/Microsoft.Build.Sql)
- [Quick tutorial](https://github.com/microsoft/DacFx/blob/main/src/Microsoft.Build.Sql/docs/Tutorial.md)
- [SQL Database Projects extension](https://learn.microsoft.com/en-us/sql/azure-data-studio/extensions/sql-database-project-extension?view=sql-server-ver16)
- [SSDT](https://learn.microsoft.com/en-us/sql/ssdt/sql-server-data-tools?view=sql-server-ver16)

## Build

To build the project, run the following command:

```bash
dotnet build
```

🎉 Congrats! You have successfully built the project and now have a `dacpac` to deploy anywhere.

## Publish

To publish the project, the SqlPackage CLI or the SQL Database Projects extension for Azure Data Studio/VS Code is required. The following command will publish the project to a local SQL Server instance:

```bash
./SqlPackage /Action:Publish /SourceFile:bin/Debug/AdventureWorks.dacpac /TargetServerName:localhost /TargetDatabaseName:AdventureWorks
```

or ...

```bash
SqlPackage /Action:Publish \
           /SourceFile:"bin\Debug\AdventureWorks.dacpac" \
           /TargetConnectionString:"Server={SERVER-NAME};Database=AdventureWorks;User Id={LOGIN};Password={PASSWORD};Encrypt=False;"
           
```

Learn more about authentication and other options for SqlPackage here: https://aka.ms/sqlpackage-ref

### Install SqlPackage CLI

If you would like to use the command-line utility SqlPackage.exe for deploying the `dacpac`, you can obtain it as a dotnet tool.  The tool is available for Windows, macOS, and Linux.

```bash
dotnet tool install -g microsoft.sqlpackage
```

### Install Microsoft.Build.Sql.Template CLI
For creating a SQL Database project like this using SqlPackage, please install the Microsoft.Build.Sql.Templates NuGet package to get started with a new SQL project.

```bash
dotnet new -i Microsoft.Build.Sql.Templates
```

After that, you could see the template when you type the command:

```bash
dotnet new list
```

|Template Name   | Short Name  | Language  |  Tags | 
|---|---|---|---|
| SQL Server Database Project | sqlproj  | SQL  |  Database/SqlServer |  

## Notes!

### Database Schema Provider

It is important to know the version of the DSP to use since this is akin to the database version. According to the @@VERSION used for the SQL Server Database, you'll need to use a different DSP definition.
This is defined inside the SQL Database project file *.sqlproj:

```xml
<DSP>Microsoft.Data.Tools.Schema.Sql.Sql150DatabaseSchemaProvider</DSP>
```
