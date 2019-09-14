# Create and Configure Storage Accounts

Training materials for the AZ-103 certification exam.

## Links

[Azure Storage Account Overview](https://docs.microsoft.com/en-us/azure/storage/common/storage-account-overview)

>An Azure storage account contains all of your Azure Storage data objects: blobs, files, queues, tables, and disks. The storage account provides a unique namespace for your Azure Storage data that is accessible from anywhere in the world over HTTP or HTTPS. Data in your Azure storage account is durable and highly available, secure, and massively scalable.

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

- https://storageaccount.blob.core.windows.net
- https://storageaccount.file.core.windows.net
- https://storageaccount.table.core.windows.net
- https://storageaccount.queue.core.windows.net

These can be configured with security, authentication, and authorization.  A custom domain name can be applied to the blob service endpoint, but this does not currently support HTTPS.  It's possible to use a content delivery network to access blobs over HTTPS from a custom domain.

### Choosing a Storage Account Type

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

### Storage Account Replication

Replication is about protecting your data from unplanned events.  Data is always replicated in the primary data center, but can be expanded with other options.

- Locally redundant storage (LRS)
- Zone-redundant storage (ZRS)
- Geo-redundant storage (GRS)
- Read-access geo-redundant storage (RA-GRS)
- Geo-zone-redundant storage (GZRS)
- Read-access geo-zone-redundant storage (RA-GZRS)

#### [Locally redundant storage (LRS)](https://docs.microsoft.com/en-us/azure/storage/common/storage-redundancy-lrs)

#### [Zone-redundant storage (ZRS)](https://docs.microsoft.com/en-us/azure/storage/common/storage-redundancy-zrs)

#### [Geo-redundant storage (GRS)](https://docs.microsoft.com/en-us/azure/storage/common/storage-redundancy-grs)

#### [Read-access geo-redundant storage (RA-GRS)](https://docs.microsoft.com/en-us/azure/storage/common/storage-redundancy-grs#read-access-geo-redundant-storage)

#### [Geo-zone-redundant storage (GZRS)](https://docs.microsoft.com/en-us/azure/storage/common/storage-redundancy-gzrs)

#### [Read-access geo-zone-redundant storage (RA-GZRS)](https://docs.microsoft.com/en-us/azure/storage/common/storage-redundancy-gzrs)

### Creating a Storage Account with the Azure Portal

Storage accounts can be created with the Azure portal from _Storage Accounts_.

### Creating a Storage Account with the Azure CLI

### Storage Account Pricing Factors

### Data Transfer Options

## Skills

### Configure Network Access to the Storage Account

### Create and Configure Storage Account

### Generate Shared Access Signature

### Install and Use Azure Storage Explorer

### Manage Access Keys

### Monitor Activity Log by Using Log Analytics

### Implement Azure Storage Replication
