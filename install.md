# Installation Guide
This guide will help us install postgresql , we will cover various methods to install postgres in future releases, As of now we will install using packages and repository configs in ubuntu 24.04 postgresql-18

## Install postgres using apt repository in ubuntu.

The PostgreSQL Apt repository supports the current versions of Ubuntu:

- stonking (26.10, non-LTS)
- resolute (26.04, LTS)
- noble (24.04, LTS)
- jammy (22.04, LTS)

on the following architectures:

- amd64
- arm64 (LTS releases only)
- ppc64el (LTS releases only)

### Option 1. Included in Distribution
Ubuntu includes PostgreSQL by default. 

```bash
sudo apt install postgresql
```

### Option 2. Automated Repository Configuration

```bash
sudo apt install -y postgresql-common
sudo /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh
```

### Option 3. Manual Repository configuration

1. Import the repository key:

```bash
sudo apt install curl ca-certificates
sudo install -d /usr/share/postgresql-common/pgdg
sudo curl -o /usr/share/postgresql-common/pgdg/apt.postgresql.org.asc --fail https://www.postgresql.org/media/keys/ACCC4CF8.asc
```

2. Create /etc/apt/sources.list.d/pgdg.sources. The distributions are called codename-pgdg. In the example, replace resolute with the actual distribution we are using. File contents:

    - Create the file:

    ```bash
    sudo tee /etc/apt/sources.list.d/pgdg.sources<< EOF
    Types: deb deb-src
    URIs: https://apt.postgresql.org/pub/repos/apt
    Suites: resolute-pgdg
    Architectures: amd64
    Components: main
    Signed-By: /usr/share/postgresql-common/pgdg/apt.postgresql.org.asc
    EOF
    ```

    - Replace the codename:
    ```bash
    sudo sed -i "s/resolute/$(. /etc/os-release && echo "$VERSION_CODENAME")/g" /etc/apt/sources.list.d/pgdg.sources
    ```

3. Install PostgreSQL:(replace "18" by the version we want)

```bash
sudo apt update
sudo apt install postgresql-18
```

> [!NOTE] 
> The repository contains many different packages including third party addons. The most common and important packages are (substitute the version number as required):

| Packages | Description |
| --- | --- |
| postgresql-client-18 | client libraries and client binaries |
| postgresql-18 |	core database server
| postgresql-doc-18 |	documentation
| libpq-dev |	libraries and headers for C language frontend development
| postgresql-server-dev-18 |	libraries and headers for C language backend development

For example if we want to install only client package of version 17

```bash
sudo apt install postgresql-client-17
```


