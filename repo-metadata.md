# Repository Metadata

## Database Information
- **Database Type**: Microsoft SQL Server
- **Database Version**: SQL Server 2016+ (DACPAC compatible versions)
- **Schema Structure**: DACPAC-based deployment model

## Platform Integrations
- **Deployment Tool**: Microsoft SqlPackage utility
- **Liquibase Features**: executeCommand change type, Flow workflows
- **Platform**: Cross-platform (Windows, Linux, macOS with SqlPackage)
- **Build Tools**: Shell scripts for deployment automation

## Use Cases
- **Primary**: SQL Server DACPAC file deployment through Liquibase
- **Secondary**: Integration of Visual Studio Database Projects with Liquibase workflows
- **Tertiary**: Hybrid deployment strategy combining DACPAC and traditional Liquibase changesets
- **Complexity Level**: Intermediate to Advanced

## Customer Scenarios
- Teams using Visual Studio Database Projects (SSDT) wanting Liquibase integration
- Organizations with existing DACPAC-based deployment pipelines
- SQL Server shops transitioning to Liquibase while maintaining DACPAC investments
- Customers requiring schema comparison and drift detection capabilities
- Enterprise environments with complex SQL Server deployment requirements

## Technical Patterns
- executeCommand integration for external tool execution
- Shell script automation for SqlPackage deployment
- DACPAC versioning and deployment strategies
- Quality checks integration for DACPAC deployments
- Flow-based deployment workflows

## Key Features
- DACPAC deployment through Liquibase changesets
- SqlPackage integration and automation
- Quality checks for DACPAC deployments
- Versioned DACPAC management
- Cross-platform deployment support
- Deployment script automation