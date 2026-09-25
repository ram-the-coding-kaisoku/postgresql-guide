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

Plain SQL backup

```bash
pg_dump --verbose -h db.xxxxxxxxxx.ap-south-1.rds.amazonaws.com -U postgres -d postgres > postgres.sql
```
- -h hostname (here i am using my rds endpoint)
- -U username
- -d database in which you want to take the backup.
- `> postgres.sql` outputing the dump to a `.sql` format
- `--verbose` gives the status while taking dump easy for troubleshooting backup errors. we will get output like below.

```
pg_dump: executing SELECT pg_catalog.set_config('search_path', '', false);
pg_dump: last built-in OID is 16383
pg_dump: reading extensions
pg_dump: identifying extension members
pg_dump: reading schemas
pg_dump: reading user-defined tables
pg_dump: reading user-defined functions
pg_dump: reading user-defined types 
pg_dump: reading procedural languages 
pg_dump: reading user-defined aggregate functions 
pg_dump: reading user-defined operators 
pg_dump: reading user-defined access methods 
pg_dump: reading user-defined operator classes 
pg_dump: reading user-defined operator families 
pg_dump: reading user-defined text search parsers 
pg_dump: reading user-defined text search templates 
pg_dump: reading user-defined text search dictionaries 
pg_dump: reading user-defined text search configurations 
pg_dump: reading user-defined foreign-data wrappers 
pg_dump: reading user-defined foreign servers 
pg_dump: reading default privileges 
pg_dump: reading user-defined collations 
pg_dump: reading user-defined conversions 
pg_dump: reading type casts 
pg_dump: reading transforms 
pg_dump: reading table inheritance information 
pg_dump: reading event triggers 
pg_dump: finding extension tables 
pg_dump: finding inheritance relationships 
pg_dump: reading column info for interesting tables 
pg_dump: finding table default expressions 
pg_dump: flagging inherited columns in subtables 
pg_dump: reading partitioning data 
pg_dump: reading indexes 
pg_dump: flagging indexes in partitioned tables 
pg_dump: reading extended statistics 
pg_dump: reading constraints 
pg_dump: reading triggers 
pg_dump: reading rewrite rules 
pg_dump: reading policies 
pg_dump: reading row-level security policies 
pg_dump: reading publications 
pg_dump: reading publication membership of tables 
pg_dump: reading publication membership of schemas 
pg_dump: reading subscriptions 
pg_dump: reading subscription membership of tables 
pg_dump: reading large objects 
pg_dump: reading dependency data 
pg_dump: saving encoding = UTF8 
pg_dump: saving "standard_conforming_strings = on" 
pg_dump: saving "search_path = " 
pg_dump: creating SCHEMA "api" 
pg_dump: creating TABLE "api.todos" 
pg_dump: creating SEQUENCE "api.todos_id_seq" 
pg_dump: creating TABLE "public.character_info" 
pg_dump: creating SEQUENCE "public.character_info_character_id_seq" 
pg_dump: creating SEQUENCE OWNED BY "public.character_info_character_id_seq" 
pg_dump: creating TABLE "public.planets" 
pg_dump: creating SEQUENCE "public.planets_planet_id_seq" 
pg_dump: creating SEQUENCE OWNED BY "public.planets_planet_id_seq" 
pg_dump: creating TABLE "public.ships" 
pg_dump: creating SEQUENCE "public.ships_ship_id_seq" 
pg_dump: creating SEQUENCE OWNED BY "public.ships_ship_id_seq" 
pg_dump: creating DEFAULT "public.character_info character_id" 
pg_dump: creating DEFAULT "public.planets planet_id" 
pg_dump: creating DEFAULT "public.ships ship_id" 
pg_dump: processing data for table "api.todos" 
pg_dump: dumping contents of table "api.todos" 
pg_dump: processing data for table "public.character_info" 
pg_dump: dumping contents of table "public.character_info" 
pg_dump: processing data for table "public.planets" 
pg_dump: dumping contents of table "public.planets" 
pg_dump: processing data for table "public.ships" 
pg_dump: dumping contents of table "public.ships" 
pg_dump: executing SEQUENCE SET todos_id_seq 
pg_dump: executing SEQUENCE SET character_info_character_id_seq 
pg_dump: executing SEQUENCE SET planets_planet_id_seq 
pg_dump: executing SEQUENCE SET ships_ship_id_seq 
pg_dump: creating CONSTRAINT "api.todos todos_pkey" 
pg_dump: creating CONSTRAINT "public.character_info character_info_pkey" 
pg_dump: creating CONSTRAINT "public.planets planets_pkey" 
pg_dump: creating CONSTRAINT "public.ships ships_pkey" 
pg_dump: creating FK CONSTRAINT "public.character_info character_info_planet_id_fkey" 
pg_dump: creating FK CONSTRAINT "public.character_info character_info_ship_id_fkey" 
pg_dump: creating ACL "SCHEMA api" 
pg_dump: creating ACL "api.TABLE todos" 
```
