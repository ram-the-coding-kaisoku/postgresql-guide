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
- Most flexible file format would be using `-Fc` and  `-Fd`
- Only Directory file format supports parallel dumps
- archive format supports parallel restoration and compressed by default.

### when to use pg_dump?

- moving data between PostgreSQL environments
- creating logical backups for smaller databases
- exporting selected schemas or tables
- testing migrations between versions or environments
- creating audit artifacts for controlled data exports


```bash
pg_dump 