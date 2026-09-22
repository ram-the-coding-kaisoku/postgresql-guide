# PostgreSQL Backup guide
This guide will help us in taking backups and restore them in postgreSQL server in VMs and cloud hosted postgreSQL as well.

## Backup

### pg_dump

- pg_dump utility is a built in tool
- Takes consistent backup without affecting other concurrent connections.
- Backup will be consistent upto the point when it is stored.
- But takes single database.
- Not suitable for regular maintanence backups.
- Dumps can be taken as plain SQL scripts / Archive files
- To restore SQL format feed it into [psql](https://www.postgresql.org/docs/current/app-psql.html), To restore archive format use [pg_restore](https://www.postgresql.org/docs/current/app-pgrestore.html)
- The archive file formats are designed to be portable across architectures.
- use pg_dump to take single database dump , then we can select which db object needs to be restored 
- Most flexible file format would be using `-Fc` and  `-Fd`
- Only Directory file format supports parallel dumps
- archive format supports parallel restoration and compressed by default.

#### Single database backup

```bash
pg_dump 