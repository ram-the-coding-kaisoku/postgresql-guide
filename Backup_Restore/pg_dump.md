# PostgreSQL Backup guide
A quick and simple guide to perform backups and restore them using pg_dump and pg_restore.

## pg_dump

- pg_dump utility is a built-in backup tool
- Takes consistent backup without affecting other concurrent connections.
- Backup will be consistent upto the point when it is stored.
- Takes backup of only 1 database.
- Not suitable for regular maintanence backups.
- Dumps can be taken as plain SQL scripts / Archive files
- To restore SQL format feed it into [psql](https://www.postgresql.org/docs/current/app-psql.html), To restore archive format use [pg_restore](https://www.postgresql.org/docs/current/app-pgrestore.html)
- The archive file formats are designed to be portable across architectures.
- use pg_dump to take single database dump , then we can select which db object needs to be restored 
- Plain SQL (-Fp, default) — outputs a .sql file. No parallel or selective restore. Compression only via external tools like gzip.
- Custom (-Fc) — outputs a .dump file. Supports parallel restore and selective restore. Built-in zlib compression.
- Directory (-Fd) — outputs a directory with one file per table. Supports parallel dump and restore. Built-in compression per file.
- Tar (-Ft) — outputs a .tar file. Supports selective restore. No compression.

|  Output Format  |  Parallel Restore  | Selective Restore | In Built Compression |
|  --- | --- | --- | --- |
Plain SQL (-Fp, default) | &#9746; | &#9746; | &#9746;
Custom (-Fc) .dump | &#9745; | &#9745; | &#9745;
Directory (-Fd) | &#9745; | &#9745; | &#9745;
Tar (-Ft) .tar | &#9745; | &#9745; | &#9746;

![pg_dump architecture](/images/pg_dump_architecture.png)

### when to use pg_dump?

- moving data between PostgreSQL environments
- creating logical backups for smaller databases
- exporting selected schemas or tables
- testing migrations between versions or environments
- creating audit artifacts for controlled data exports

### sample scenarios

1. Plain SQL backup and restore:

```bash
pg_dump --verbose -h db.xxxxxxxxxx.ap-south-1.rds.amazonaws.com -U postgres -d postgres > postgres.sql
```
- -h hostname (here i am using my rds endpoint)
- -U username
- -d database in which you want to take the backup.
- `> postgres.sql` outputing the dump to a `.sql` format
- `--verbose` gives the status while taking dump easy for troubleshooting backup errors.

However we cannot actually use this file format using pg_restore to restore in the database. we can simply pass this backup file to psql itself

```bash
psql -h pg-db.xxxxxxxx.ap-south-1.rds.amazonaws.com -U postgres -d postgres < postgres.sql
```

2. To dump a database into a custom-format archive file:

Backup

```bash
pg_dump -Fc --verbose -h pg-db.xxxxxxx.ap-south-1.rds.amazonaws.com -U postgres -d postgres > postgres.dump
```

Restore

```bash
pg_restore --verbose -h pg-db.xxxxxxx.ap-south-1.rds.amazonaws.com -U postgres -d template1 postgres.dump
```

- We should pass another database in the command, pg_restore will only connect to the other database for creating the intended database then switch the connection before restoring database objects.

```
pg_restore: creating DATABASE "postgres"
pg_restore: connecting to new database "postgres"
```

3. Take Backup of single table:

Backup 

```bash
pg_dump -Fc --verbose -h pg-db.xxxxxxxx.ap-south-1.rds.amazonaws.com -U postgres -d template1 -n public -t planets -t ships > tables.dump
```
- `-n` Give the schema name where tables live.
- `-t` Give the table name which we want to take backup. Multiple table requires multiple `-t` options.

Restore

```bash
pg_restore --clean --verbose -h pg-db.xxxxxxx.ap-south-1.rds.amazonaws.com -U postgres -d postgres tables.dump
```
- `--clean` flag will drop the database objects before restoring them.

To get more detail about pg_dump utility check [pg_dump](https://www.postgresql.org/docs/current/app-pgdump.html).


## pg_dump

This section will help us work on the pg_dumpall utility












