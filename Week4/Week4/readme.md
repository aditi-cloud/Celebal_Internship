# Azure Cloud Fundamentals and Data Pipeline Implementation using Azure Data Factory

## Overview

This project demonstrates the fundamentals of Microsoft Azure by building a simple end-to-end data pipeline using **Azure Blob Storage** and **Azure Data Factory (ADF)**. The objective is to understand Azure cloud services, configure storage resources, create data pipelines, and execute them successfully.

The pipeline reads a CSV file stored in Azure Blob Storage, validates its metadata, and copies it to a different location within the same storage account.

---

## Objectives

- Understand basic Azure cloud services.
- Create and manage Azure resources.
- Configure Azure Blob Storage.
- Build an Azure Data Factory pipeline.
- Validate file metadata before processing.
- Copy data from a source container to a destination container.
- Execute and monitor the pipeline successfully.
- Manage resource access using Azure IAM roles.

---

## Technologies Used

- Microsoft Azure Portal
- Azure Storage Account
- Azure Blob Storage
- Azure Data Factory (ADF)
- Azure IAM (Identity and Access Management)

---

## Project Architecture

```
                +---------------------+
                |   Local CSV File    |
                +----------+----------+
                           |
                           |
                           ▼
                +---------------------+
                | Azure Blob Storage  |
                |   input-data        |
                +----------+----------+
                           |
                           ▼
                +---------------------+
                |  Get Metadata       |
                | (Validate File)     |
                +----------+----------+
                           |
                           ▼
                +---------------------+
                |   Copy Data         |
                | Azure Data Factory  |
                +----------+----------+
                           |
                           ▼
                +---------------------+
                | Azure Blob Storage  |
                |   output-data       |
                +---------------------+
```

---


---

# Azure Resources Created

## Resource Group

```
ADFAssignmentRG
```

---

## Storage Account

Azure Storage Account was created to store the source and destination CSV files.

### Blob Containers

- input-data
- output-data

---

## Azure Data Factory

A new Azure Data Factory instance was created for developing and executing the data pipeline.

---

# Dataset Used

The project uses the **Superstore** dataset in CSV format.

```
Sample - Superstore.csv
```

The file was uploaded into the **input-data** Blob container.

---

# Pipeline Components

## 1. Linked Service

A Linked Service was created to establish a secure connection between Azure Data Factory and Azure Blob Storage.

---

## 2. Source Dataset

Configured to read the CSV file from:

```
input-data/
```

---

## 3. Destination Dataset

Configured to write the processed file into:

```
output-data/
```

---

## 4. Get Metadata Activity

The **Get Metadata** activity validates the source file before processing.

Metadata collected includes:

- File Exists
- File Size
- Last Modified Time

---

## 5. Copy Data Activity

The Copy Data activity copies the CSV file from the source Blob container to the destination Blob container.

---

# Pipeline Workflow

```
Source CSV
      │
      ▼
Get Metadata
      │
      ▼
Copy Data
      │
      ▼
Destination CSV
```

---

# Pipeline Execution

The pipeline was executed using **Debug** mode in Azure Data Factory.

Execution Status:

```
Succeeded
```

The output file was successfully generated inside the destination Blob container.

---

# IAM Configuration

The following Azure roles were assigned:

- Reader
- Contributor
- Storage Blob Data Contributor

These permissions enabled Azure Data Factory to access Azure Blob Storage securely.

---

# Expected Output

After successful execution:

- Source CSV validated
- Metadata successfully retrieved
- Data copied successfully
- Output file generated in destination Blob Storage
- Pipeline execution completed without errors

---

# Learning Outcomes

Through this assignment, I gained hands-on experience with:

- Azure Resource Groups
- Azure Storage Accounts
- Azure Blob Storage
- Azure Data Factory
- Linked Services
- Datasets
- Pipeline Design
- Get Metadata Activity
- Copy Data Activity
- Pipeline Monitoring
- Azure IAM Role Management

---

# Conclusion

This project successfully demonstrates the implementation of a basic ETL-style data pipeline using Azure services. By integrating Azure Blob Storage with Azure Data Factory, the pipeline validates the source file using the **Get Metadata** activity and copies it to a new destination using the **Copy Data** activity. The successful execution of the pipeline highlights the practical use of Azure Data Factory for orchestrating cloud-based data movement and reinforces fundamental cloud concepts such as resource management, storage services, pipeline orchestration, and access control.

---
**Author:** Aditi Gaikwad