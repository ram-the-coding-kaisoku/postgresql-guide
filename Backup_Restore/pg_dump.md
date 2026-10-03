# PostgreSQL Backup Guide

## pg_dump

`pg_dump` is a built-in PostgreSQL utility used to take a **logical backup of a single database**.

### Key Points

* Takes a **consistent backup** without affecting other concurrent connections.
* The backup represents the database state **at the point when the dump was taken**.
* Backs up **one database at a time**.
* Supports **selective restoration** of database objects when using archive formats.
* Backup can be created in different formats:

  * **Plain SQL (`-Fp`)** – SQL script, default format.
  * **Custom (`-Fc`)** – Archive format with selective and parallel restore support.
  * **Directory (`-Fd`)** – Directory format with parallel dump and restore support.
  * **Tar (`-Ft`)** – TAR archive with selective restore support.
* Plain SQL backups are restored using `psql`.
* Archive format backups are restored using `pg_restore`.
* Archive formats are designed to be **portable across different architectures**.
* Mainly used for **logical database backups**, not regular physical maintenance backups.

| Output Format              | Parallel Restore | Selective Restore | Built-in Compression |
| -------------------------- | ---------------- | ----------------- | -------------------- |
| Plain SQL (`-Fp`, default) | ❌                | ❌                 | ❌                    |
| Custom (`-Fc`) `.dump`     | ✅                | ✅                 | ✅                    |
| Directory (`-Fd`)          | ✅                | ✅                 | ✅                    |
| Tar (`-Ft`) `.tar`         | ❌                | ✅                 | ❌                    |

![pg\_dump architecture](/images/pg_dump_architecture.png)

### When to Use `pg_dump`?

* Moving data between PostgreSQL environments.
* Creating logical backups for smaller databases.
* Exporting selected schemas or tables.
* Testing migrations between PostgreSQL versions or environments.
* Creating audit artifacts for controlled data exports.

### Sample Scenarios

#### 1. Plain SQL Backup and Restore

**Backup:**

```bash
pg_dump --verbose -h hostname/IPaddress -U postgres -d postgres > postgres.sql
```

* `-h` – Hostname or IP address. Here, an RDS endpoint can be used.
* `-U` – Username.
* `-d` – Database from which the backup is taken.
* `> postgres.sql` – Redirects the dump output to a `.sql` file.
* `--verbose` – Displays detailed progress information, which can help troubleshoot backup errors.

A plain SQL dump **cannot be restored using `pg_restore`**. It should be passed directly to `psql`.

**Restore:**

```bash
psql -h hostname/IPaddress -U postgres -d postgres < postgres.sql
```

---

#### 2. Custom-Format Backup and Restore

**Backup:**

```bash
pg_dump -Fc --verbose -h hostname/IPaddress -U postgres -d postgres > postgres.dump
```

**Restore:**

```bash
pg_restore --verbose -h hostname/IPaddress -U postgres -d postgres postgres.dump
```

The custom format supports features such as **selective restore** and **parallel restore**.

> **Note:** If the dump was created with `pg_dump --create`, `pg_restore` can create the database from the dump. Otherwise, the target database must already exist.

---

#### 3. Backup of Specific Tables

**Backup:**

```bash
pg_dump -Fc --verbose \
  -h hostname/IPaddress \
  -U postgres \
  -d template1 \
  -n public \
  -t planets \
  -t ships \
  > tables.dump
```

* `-n` – Specifies the schema containing the tables.
* `-t` – Specifies the table to back up.
* Multiple tables can be specified using multiple `-t` options.

**Restore:**

```bash
pg_restore --clean --verbose \
  -h hostname/IPaddress \
  -U postgres \
  -d postgres \
  tables.dump
```

* `--clean` – Drops the database objects before restoring them.

For more information, see the [PostgreSQL `pg_dump` documentation](https://www.postgresql.org/docs/current/app-pgdump.html).

---

## pg_dumpall

`pg_dumpall` is a PostgreSQL utility used to back up **all databases in a PostgreSQL cluster** into a single SQL script file.

### Key Points

* Dumps **all databases** in the PostgreSQL cluster.
* Internally uses `pg_dump` to dump each database.
* Also backs up **global objects** that `pg_dump` does not include:

  * Database roles/users.
  * Tablespaces.
  * Privilege grants for configuration parameters.
* The output is a **SQL script** containing commands that can be executed using `psql` to restore the cluster.
* A PostgreSQL **superuser** is generally required to create a complete dump.
* **Superuser privileges** are also required when restoring the dump because the script may create roles and databases.
* `pg_dumpall` connects to the PostgreSQL server **multiple times**, once for each database.
* If password authentication is enabled, it may ask for the password for each connection.
* To avoid repeated password prompts, configure a `~/.pgpass` file.

### Sample Scenarios

#### Dumps all database objects from a postgres cluster into a script file.

**Backup:**

```bash
pg_dumpall --verbose --clean --if-exists > pg_cluster.out
```

**Restore:**

```bash
psql -X -f pg_cluster.out -d postgres
```

#### Dump only database roles and users.

**Backup:**

```bash
pg_dumpall --verbose --clean --roles-only > pg_roles.out
```

For more information, see the [PostgreSQL `pg_dumpall` documentation](https://www.postgresql.org/docs/current/app-pg-dumpall.html).


