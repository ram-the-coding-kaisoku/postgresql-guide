# PostgreSQL Backup guide
This guide will help us in taking backups and restore them in postgreSQL server in VMs and cloud hosted postgreSQL as well.

## Backup

# pg_dump

- pg_dump utility is a built in tool
- Takes consistent backup without affecting other concurrent connections.
- Backup will be consistent upto the point when it is stored.
- But takes single database.
- Not suitable for regular maintanence backups.
- Dumps can be taken as plain SQL scripts / Archive files
- To restore SQL format feed it into [psql](https://www.postgresql.org/docs/current/app-psql.html), To restore archive format use [pg_restore](https://www.postgresql.org/docs/current/app-pgrestore.html)