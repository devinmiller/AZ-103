# Create and Configure Storage Accounts

Training materials for the AZ-103 certification exam.

## Links

[Azure Storage Account Overview](https://docs.microsoft.com/en-us/azure/storage/common/storage-account-overview)

>An Azure storage account contains all of your Azure Storage data objects: blobs, files, queues, tables, and disks. The storage account provides a unique namespace for your Azure Storage data that is accessible from anywhere in the world over HTTP or HTTPS. Data in your Azure storage account is durable and highly available, secure, and massively scalable.

[Azure Storage Redundancy](https://docs.microsoft.com/en-us/azure/storage/common/storage-redundancy)

>The data in your Microsoft Azure storage account is always replicated to ensure durability and high availability. Azure Storage copies your data so that it is protected from planned and unplanned events, including transient hardware failures, network or power outages, and massive natural disasters. You can choose to replicate your data within the same data center, across zonal data centers within the same region, or across geographically separated regions.

## Introduction

Features of Azure Storage

- Durable
- Highly Available
- Secure
- Scalable
- Accessible
- Cost Effective

### Overview of Azure Storage

A storage account is the top level container for various storage services in Azure.

- Blob Storage
  - Object storage solution for storing massive amounts of unstructured data or binary data (images files, videos, virtual machine images)
    - Structured Data: text files and documents
    - Binary Data: image files, videos, and virtual machine images
  - Ideal for serving images or documents directly to the browser or storing data for backup and archiving
  - Features blob storages tiers where infrequently accessed files can be stored in either cool or archive storage tiers for reduced storage costs
  - Life cycle management feature to set policies that can migrate blobs between storage tiers
  - Create snapshots of blobs
  - Leasing blobs to prevent modification by other users
  - Soft delete provides a "recycle bin" functionality
  - Hosting of static websites directly in blob storage without compute charges
  - Integrates closely with other Azure services, such as Content Delivery Networks and Azure Search
    - Azure Search provides the ability to search blob contents within an application
      - For example, the text within a Word document or PDF

- File Storage
  - Supports the SMB file share protocol
    - Storage can be attached to multiple virtual machines for read and write access
    - Shows up with a drive letter like regular file shares
    - Allows for content to be shared across multiple virtual machines
      - Such as installation media, log files, etc.
    - Great for migrating on premise data to Azure with minimal changes
  - Files can be made accessible using a url to the file with a security token appended
    - Theses tokens are called shared access signatures
  - Supports role based access control when accessed from virtual machines joined to Azure AD domain services
  - Integrated with on-premises storage by way of Azure File Sync
    - Allows for tiering files based on usage
      - Keep recently accessed files on on-premises servers
      - Move older or infrequently accessed files to Azure

- Table Storage
  - NoSQL data store that allows for the storage of massive amounts structured, non-relational data
  - Store data in a schema-less design where entities can contain different properties in a single table
  - The premium version, Azure Cosmos DB, is for mission critical applications
    - Provides faster performance and more throughput with global distribution through additional read regions
    - Applications written for table storage can be migrated to Cosmos DB without any changes by using the Table API
  - Table storage is one of five APIs available in Cosmos DB
    - Table API
    - SQL API
    - MongoDB API
    - Graph API
    - Cassandra API

- Queue Storage
  - Used to store and retrieve messages
  - For asynchronous applications that pass messages to each other
  - Helps decouple application components for independent scaling
  - Helps build process workflows

  Each storage account service has a unique url address for accessing the data over the internet.  

- [https://storageaccount.blob.core.windows.net](https://storageaccount.blob.core.windows.net)
- [https://storageaccount.file.core.windows.net](https://storageaccount.file.core.windows.net)
- [https://storageaccount.table.core.windows.net](https://storageaccount.table.core.windows.net)
- [https://storageaccount.queue.core.windows.net](https://storageaccount.queue.core.windows.net)

These can be configured with security, authentication, and authorization.  A custom domain name can be applied to the blob service endpoint, but this does not currently support HTTPS.  It's possible to use a content delivery network to access blobs over HTTPS from a custom domain.

### Storage Account Pricing Factors

There cost for storage is determined by the storage settings chosen, and the number of operations (read, write, etc.) performed during the billing period.  The billable operations vary based on the selected storage account type.

Settings that affect storage costs include:

- Region ( West US vs East US)
- Access Tier (Hot, Cool, Archive)
- Redundancy Type (LRS, ZRS, GRS)
- Performance Tier (Standard vs Premium)
- Capacity (100GB vs 1000GB)

For details on operation pricing, the Azure pricing calculator is a good resource for up to date information.

[Azure Pricing Calculator](https://azure.microsoft.com/en-us/pricing/calculator/)

### Data Transfer Options

There is no charge for uploading data into Azure, but there are per gigabyte charges when data is read or downloaded out of an Azure region.  

## Skills

### Configure Network Access to the Storage Account

### Create and Configure Storage Account

An Azure Storage account provides a unique namespace to store and access Azure Storage data objects.  All objects in a storage account are billed together as a group.

Blob Types

- Block Blob
  - For storing blobs up to 4.75TB in size
  - Broken down into blocks of 100MB
  - Can insert, replace, and delete blocks
- Append Blob
  - Can only append data on the end of the blob
  - Optimized for fast append operations
    - Ideal for log or audit files
  - Limited to 195GB max file size
- Page Blob
  - Used for storing VHD files
  - Foundation for infrastructure as a service disks
  - Underlying storage used for Azure SQL database
  - Designed for frequent random read/write operations
  - Can grow up to 8TB in size
  - Can be placed on premium storage
  - Only offered in general purpose account types

Storage Account Types:

- General Purpose V2
- General Purpose V1
- Blob Storage
- Block Blob Storage
- File Storage

The General Purpose V1, General Purpose V2, and Blob Storage accounts are available on standard storage backed hard disk drive.  The Block Blob Storage and File Storage accounts are available on premium storage backed by solid state drives.

Storage accounts can be created with the Azure portal from the _Storage Accounts_ page.

[Manage Storage Accounts Using PowerShell](storage-powershell.md)

[Manage Storage Accounts Using Azure CLI](storage-cli.md)

#### General Purpose V2

Supported Services:

- Blob Storage
- File Storage
- Table Storage
- Queue Storage

This is the recommended choice when creating a new storage account.  It provides support for Blob Storage Tiers and has lower storage costs than General Purpose V1 account.

While storage is limited to 500TB in General Purpose V1 account, in a General Purpose V2 (and Blob Storage) account the max size can be increased up to 5PB.  There are also increase in IOPS and ingress/egress speeds for moving data in and out of Azure.

The published limits for Azure storage accounts are often soft limits that can be increased by contacting Microsoft.

#### General Purpose V1

Supported Services:

- Blob Storage
- File Storage
- Table Storage
- Queue Storage

Does _not_ support Blob Access Tiers, so no benefits from hot, cool, and archive tiers.  This is the oldest storage account type, supporting the classic deployment model.   Can still use Resource Manager Deployment, but does not support all the features of V2 storage.

Transactions costs are slightly cheaper when compared to Blob storage or General Purpose V2 storage.

Can be easily upgrade to General Purpose V2 storage.

#### Blob Storage

Only used for storing blobs, just like the name suggests.
  
Supported Blob Types

- Block Blobs
- Append Blobs

Blob Storage Tiers

- Hot Tier
  - Indicates blobs are accessed more frequently
  - Lower data access cost
  - Higher data storage cost
- Cool Tier
  - Expect blobs to be accessed less frequently
  - Higher data access cost
  - Lower data storage cost
- Archive Tier
  - Essentially puts the blob offline
  - Delay to make the blob available
  - Highest data access cost
  - Lowest data storage cost

#### Block Blob Storage

Allows for storing blobs on premium storage.

Supported Services:

- Blob Storage

Supported Blob Types:

- Block Blobs
- Append Blobs

This provides better performance for scenarios with -

- High transaction rates
- Using smaller objects
- Low storage latency requirements

Does _not_ support Blob Storage Access Tiers.

#### File Storage

Supports file shares backed by premium storage.

Support Services:

- File Storage

Premium files shares provide consistent high performance and low latency.  Includes IOPS bursting feature, providing up to three times the input/output operations per seconds.  Based on a credit system that builds credits when the file share isn't meeting it's base IOPS usage.

### Generate Shared Access Signature

A Shared Access Signature (SAS) is a security token string that can be attached to a url to an Azure resource.  Contains permissions and a range of time for which access is valid.

Types of Shared Access Signatures

- Service Level SAS
  - Delegate access to a single storage storage service (blob, file, queue, or table)
- Account Level SAS
  - Delegate access to multiple services in a storage account
  - Provides additional administrative permissions

Access to resources can be broken down further by creating SAS token with specific permissions.

Shared Access Signature Features

- Read and/or Write Permissions
- Limited Range of Table Data
- Temporary Access
- Restrict Access to IP Addresses
- Enforce HTTPS through SAS

Shared Access Signature Parameters

- REST API version
- Validity start time
- Validity end time
- Type of resource
- Permissions (read, write, delete, list)
- IP address / range (optional)
- Protocol (optional)
- Signature (Parameters signed with Storage Account Key)

Certain services have other parameters available.

Shared Access Signatures are generated client side, using PowerShell, the CLI, client side libraries, or the Azure portal.  However, Azure doesn't track SAS tokens after they are created.  To invalidate a token, the Storage Account Key used to sign the token must be regenerated.  SAS token are best used in conjunction with stored access policies.

### Install and Use Azure Storage Explorer

### Manage Access Keys

There are two types of access to consider when granting access to a storage account.

- Management Plane
  - Administrative tasks for the storage account
  - Viewing properties assigning privileges, modifying configuration
  - Permissions assigned through Role Based Access Control (RBAC)
    - Roles with access to Storage Account Keys will have access to storage data
    - Storage Account Contributor, Storage Account Key Operator Service, etc.
- Data Plane
  - Anonymous Access
    - Blobs only
    - Set using public access level on blob container
  - Authenticated Access
    - Storage Account Keys
      - Provides full access to the storage account
    - Shared Access Signature
      - String which contains limited permissions to a data object
    - Azure AD Authentication with RBAC
      - Manage access to blob containers and queues for user and applications

Azure Key Vault can manage Storage Account Keys and generate SAS.

#### Storage Account Keys

- There are two keys are available for every storage accounts
- Provides full access to data plane of the Storage Account  
- Can be used by either applications or users to access data
- Each Storage Account Key can be regenerated individually
  - Apps and admins should use the _same_ key
  - Regenerate secondary key
  - Update apps to use secondary key
  - Regenerate primary key

### Monitor Activity Log by Using Log Analytics

### Implement Azure Storage Replication

Replication is about protecting your data from unplanned events.  Data is always replicated in the primary data center, but can be expanded with other options.

- Locally redundant storage (LRS)
- Zone-redundant storage (ZRS)
- Geo-redundant storage (GRS)
- Read-access geo-redundant storage (RA-GRS)
- Geo-zone-redundant storage (GZRS)
- Read-access geo-zone-redundant storage (RA-GZRS)

#### [Locally redundant storage (LRS)](https://docs.microsoft.com/en-us/azure/storage/common/storage-redundancy-lrs)

Terminology:

- Storage Scale Unit
  - A collection of racks of storage nodes
  - Basic replication unit within a data center
- Fault Domain
  - A group of nodes that represent a physical unit of failure
  - Thought of as nodes belonging to the same physical rack
- Upgrade Domain
  - A group of nodes that are upgraded together during the process of a service  upgrade (rollout)

Data is replicated synchronously to a storage scale unit within a data center in the storage account region.  The replicas are spread across fault and update domains within one storage scale unit.  This ensures data is available if a hardware failure affects a physical server rack, or when nodes are unavailable due to a service upgrade. This is the lowest cost replication option, and also the least durable.  If a data center level disaster occurs, all data replicas may be lost or unrecoverable.

A write request to an LRS storage account returns successfully only after the data is written to all replicas.

#### [Zone-redundant storage (ZRS)](https://docs.microsoft.com/en-us/azure/storage/common/storage-redundancy-zrs)

Terminology:

- Availability Zone
  - Unique physical locations within an Azure region
  - One or more data centers equipped with independent power, cooling, and networking
  - Minimum of three separate zones in all enabled regions
- Storage Cluster
  - Two or more storage servers working together to increase performance, capacity, or reliability.

Data is replicated synchronously to three storage clusters in a single region.  Each storage cluster is located in a separate availability zone.  

A write request to an ZRS storage account returns successfully only after the data is written to all storage cluster replicas.

#### [Geo-redundant storage (GRS)](https://docs.microsoft.com/en-us/azure/storage/common/storage-redundancy-grs)

Data is replicated to a secondary region that is hundreds of miles away.  This type of replication ensures data is available even in the event of a regional disaster.  All data is first replicated locally in the primary region using LRS, then replicated asynchronously to the secondary region.  In the secondary region, the data is again replicated locally using LRS.

Both the primary and secondary regions manage replicas across separate fault domains and upgrade domains within a storage scale unit.

#### [Read-access geo-redundant storage (RA-GRS)](https://docs.microsoft.com/en-us/azure/storage/common/storage-redundancy-grs#read-access-geo-redundant-storage)

Data is replicated with GRS, however, RA-GRS provides read-only access to the data in the secondary region.

#### [Geo-zone-redundant storage (GZRS)](https://docs.microsoft.com/en-us/azure/storage/common/storage-redundancy-gzrs)

Like ZRS, this replicates data synchronously across three Azure availability zones, however, with GZRS the data is then replicated asynchronously to a secondary region.  

#### [Read-access geo-zone-redundant storage (RA-GZRS)](https://docs.microsoft.com/en-us/azure/storage/common/storage-redundancy-gzrs)

Data is replicated with ZGRS, however, RA-ZGRS provides read-only access to the data in the secondary region.
