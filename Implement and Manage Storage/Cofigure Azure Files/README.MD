# Configure Azure Files

Training materials for the AZ-103 certification exam.

## Links

[Use an Azure File Share with Windows](https://docs.microsoft.com/en-us/azure/storage/files/storage-how-to-use-files-windows)

>Azure Files is Microsoft's easy-to-use cloud file system. Azure file shares can be seamlessly used in Windows and Windows Server.

## Introduction

Azure Files provides a flexible, easy to use SMB-compatible storage solution and with Azure Fils Sync becomes a core part of the organization's file storage strategy.

### SMB Overview

File-based protocol that can be mounted by Windows, Linux, and Mac OS.  

There are two primary versions of SMB used today.

- Version 2.1
  - Primarily used for document storage
  - No encryption support
  - Introduced with Windows 7 and Windows Server 2008 R2
  - Greatly improved network performance over SMB 1.0
- Version 3
  - Enterprise application ready with active-active support, transparent failover, multi-channel and RDMA support (SMB Direct) enabling use by workloads such as SQL Server and Hyper-V
  - Encryption support
  - Supported by Windows 8, Windows Server 2012, and above

  Non-Windows SMB support varies by OS distribution and version.

### Azure Storage Overview

- One of the foundational services in Azure
- Utilized through the creation of a storage account
- A storage account has various properties
  - Account kind
  - Location
  - Replication
  - Performance
  - Secure transfer requirement
  - Virtual network configuration
- Different storage services are support: Blob, Queue, Table, and Files

#### Azure Storage Encryption

- By default storage accounts are transparently encrypted at rest using a 256-bit AES encryption, Storage Service Encryption (SSE)
  - This cannot be disabled and has no performance impact
  - This applies to blobs, queues, tables, and files
- For blob and files customer-managed keys can be used through integration with Azure Key Vault
- Any replicas, e.g. GRS, match the same level of encryption as the primary

#### Secure Transfer

- Encrypted connections to storage is optional
- Secure transfer required is an optional configuration that requires use of HTTPS via REST API and SMB 3 with encryption for Azure Files
- When using encrypted connections with Azure Files, access is available to the file share outside of the Azure Region
  - Other Azure regions
  - Internet based clients providing port 445 (SMB) is enabled
  - To test if 445 is available to use
  
    ``` powershell
    PS C:\> Test-NetConnection - ComputerName <stoage account> -Port 445
    ```

#### Firewall and Virtual Network Integration

- By default the various endpoints of the storage account are accessible to any client with the required keys
- Specific ranges of IP addresses can be granted access
- Virtual Network Integration enables access only from specific subnets of virtual networks within the same and paired region as the storage account
- Service endpoints for Azure Storage are provisioned on the subnets of the target virtual network
  - The firewall of the storage account is modified to allow access only from the specific service endpoints

### When to Use Azure Files

Why use Azure Files?

- Azure Files provides an Azure Storage based SMB solution.
- SMB 2.1 and 3 supported in addition for File REST protocol
- Benefits from Azure hosting
  - SLAs - 99.9%
  - Availability - Worldwide footprints of regions
  - Redundancy
  - Disaster Recovery
- Typical Use Cases
  - Lift and shift
  - Hybrid solutions
  - Born-in-cloud applications that require shared storage area
  - Storage for cross-platform solutions
  - Any workload that currently uses a file server or NAS providing SMB access

### Accessing Azure Files

- Access is via standard SMB client
- Dialect of SMB is negotiated between the client and Azure Files upon connection
- Encryption used if outside the Azure region or if required as part of the storage account configuration
- SMB access utilizes the storage account name and access key
- REST access can utilize Shared Access Signatures (SAS)

A Shared Access Signature (SAS) can be used to access Azure Files when using the REST API, for example using the PowerShell cmdlets.

Shared Access Signature Usage

- When using SAS access to specific shares and files can be generated
- SAS tokens can be based on policies
- Tokens can limit rights and the duration of access
- The SAS token is used when establishing the storage context (the actual connection)

Azure Active Directory Authentication

- Granular Access Control Lists that are integrated with corporate identity provide an optimal end-user experience
- Azure Files utilize Azure AD for authentication via Azure AD Domain Services

Azure AD Authentication Requirements

- Azure AD Domain Services must be deployed to the virtual network
  - It is linked to one, and only one, virtual network
- Usage must be from a machine joined to the Azure AD Domain Service instance
- Access Control Lists must be copied to Azure Files via Robocopy
- The Azure Files share must NOT be part of an Azure File Sync sync group
- A drive must be mapped to the Azure Files share

### Quota, Limits, and Security

### Snapshot Capabilities

## Skills

### Create Azure File Share

- Multiple Azure File shared can be created under a storage account
- Each File Share has a name and optional quota assigned
- Encryption used if outside the Azure region or if required as part of the storage account configuration
- SMB access utilizes the storage account name and access key for credentials
- REST access can utilize Shared Access Signatures (SAS)

### Create Azure File Sync Service

### Troubleshoot Azure File Sync
