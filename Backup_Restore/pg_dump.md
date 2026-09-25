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
pg_dump: executing SELECT pg_catalog.set_config('search_path', '', false);<br>
pg_dump: last built-in OID is 16383<br>
pg_dump: reading extensions<br>
pg_dump: identifying extension members<br>
pg_dump: reading schemas<br>
pg_dump: reading user-defined tables<br>
pg_dump: reading user-defined functions<br>
pg_dump: reading user-defined types <br>
pg_dump: reading procedural languages <br>
pg_dump: reading user-defined aggregate functions <br>
pg_dump: reading user-defined operators <br>
pg_dump: reading user-defined access methods <br>
pg_dump: reading user-defined operator classes <br>
pg_dump: reading user-defined operator families <br>
pg_dump: reading user-defined text search parsers <br>
pg_dump: reading user-defined text search templates <br>
pg_dump: reading user-defined text search dictionaries <br>
pg_dump: reading user-defined text search configurations <br>
pg_dump: reading user-defined foreign-data wrappers <br>
pg_dump: reading user-defined foreign servers <br>
pg_dump: reading default privileges <br>
pg_dump: reading user-defined collations <br>
pg_dump: reading user-defined conversions <br>
pg_dump: reading type casts <br>
pg_dump: reading transforms <br>
pg_dump: reading table inheritance information <br>
pg_dump: reading event triggers <br>
pg_dump: finding extension tables <br>
pg_dump: finding inheritance relationships <br>
pg_dump: reading column info for interesting tables <br>
pg_dump: finding table default expressions <br>
pg_dump: flagging inherited columns in subtables <br>
pg_dump: reading partitioning data <br>
pg_dump: reading indexes <br>
pg_dump: flagging indexes in partitioned tables <br>
pg_dump: reading extended statistics <br>
pg_dump: reading constraints <br>
pg_dump: reading triggers <br>
pg_dump: reading rewrite rules <br>
pg_dump: reading policies <br>
pg_dump: reading row-level security policies <br>
pg_dump: reading publications <br>
pg_dump: reading publication membership of tables <br>
pg_dump: reading publication membership of schemas <br>
pg_dump: reading subscriptions <br>
pg_dump: reading subscription membership of tables <br>
pg_dump: reading large objects <br>
pg_dump: reading dependency data <br>
pg_dump: saving encoding = UTF8 <br>
pg_dump: saving "standard_conforming_strings = on" <br>
pg_dump: saving "search_path = " <br>
pg_dump: creating SCHEMA "api" <br>
pg_dump: creating TABLE "api.todos" <br>
pg_dump: creating SEQUENCE "api.todos_id_seq" <br>
pg_dump: creating TABLE "public.character_info" <br>
pg_dump: creating SEQUENCE "public.character_info_character_id_seq" <br>
pg_dump: creating SEQUENCE OWNED BY "public.character_info_character_id_seq" <br>
pg_dump: creating TABLE "public.planets" <br>
pg_dump: creating SEQUENCE "public.planets_planet_id_seq" <br>
pg_dump: creating SEQUENCE OWNED BY "public.planets_planet_id_seq" <br>
pg_dump: creating TABLE "public.ships" <br>
pg_dump: creating SEQUENCE "public.ships_ship_id_seq" <br>
pg_dump: creating SEQUENCE OWNED BY "public.ships_ship_id_seq" <br>
pg_dump: creating DEFAULT "public.character_info character_id" <br>
pg_dump: creating DEFAULT "public.planets planet_id" <br>
pg_dump: creating DEFAULT "public.ships ship_id" <br>
pg_dump: processing data for table "api.todos" <br>
pg_dump: dumping contents of table "api.todos" <br>
pg_dump: processing data for table "public.character_info" <br>
pg_dump: dumping contents of table "public.character_info" <br>
pg_dump: processing data for table "public.planets" <br>
pg_dump: dumping contents of table "public.planets" <br>
pg_dump: processing data for table "public.ships" <br>
pg_dump: dumping contents of table "public.ships" <br>
pg_dump: executing SEQUENCE SET todos_id_seq <br>
pg_dump: executing SEQUENCE SET character_info_character_id_seq <br>
pg_dump: executing SEQUENCE SET planets_planet_id_seq <br>
pg_dump: executing SEQUENCE SET ships_ship_id_seq <br>
pg_dump: creating CONSTRAINT "api.todos todos_pkey" <br>
pg_dump: creating CONSTRAINT "public.character_info character_info_pkey" <br>
pg_dump: creating CONSTRAINT "public.planets planets_pkey" <br>
pg_dump: creating CONSTRAINT "public.ships ships_pkey" <br>
pg_dump: creating FK CONSTRAINT "public.character_info character_info_planet_id_fkey" <br>
pg_dump: creating FK CONSTRAINT "public.character_info character_info_ship_id_fkey" <br>
pg_dump: creating ACL "SCHEMA api" <br>
pg_dump: creating ACL "api.TABLE todos" <br>
```
