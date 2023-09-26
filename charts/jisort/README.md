# Jisort packaged with Apache Fineract

[Fineract](https://github.com/apache/fineract) is a mature platform with open APIs that provides a reliable, robust, and affordable core banking solution for financial institutions offering services to the world’s 3 billion underbanked and unbanked.

## Introduction

This chart bootstraps a [Jisort](https://github.com/truehostcloud/jisort) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

It also packages the [Bitnami MySQL chart](https://github.com/bitnami/charts/tree/main/bitnami/mysql) which is required for bootstrapping a MySQL deployment for the database requirements of the Jisort application.

## Prerequisites

 - Kubernetes 1.19+
 - Helm 3.2.0+
 - PV provisioner support in the underlying infrastructure

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm repo add jisort https://jisort.github.io/helm-charts/
```

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Parameters

### Database Parameters

| Name | Description | Value |
|------|-------------|-------|
| `mysql.auth.rootPassword` | Database root password | `""` |
| `mysql.auth.database` | Database name to create | `fineract_tenants` |
| `mysql.auth.username` | Database user to create | `fineract` |
| `mysql.auth.password` | Password for the database user | `""` |

### Tenant Parameters

| Name | Description | Value |
|------|-------------|-------|
| `tenant.connectionParams` | Tenant connection parameters | `""` |
| `tenant.identifier` | Tenant identifier | `default` |
| `tenant.name` | Tenant name | `Default Tenant` |
| `tenant.timezone` | Tenant timezone | `Africa/Nairobi` |

### Trafic Exposure Parameters

| Name | Description | Value |
|------|-------------|-------|
| `ingress.hostname` | Default host for the ingress record | `""` |
