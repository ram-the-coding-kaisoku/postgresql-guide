# This is a simple guide on implementing postgrest for RDS
## Postgrest installation.
Download and install the PostgREST release supported by the target environment. For this implementation, PostgREST version 16.3 is used.

1.	Download the PostgREST release from the official GitHub release page: [latest-release](https://github.com/PostgREST/postgrest/releases/tag/v16.3)

2.	Download the Linux static binary:
```bash
wget https://github.com/PostgREST/postgrest/releases/download/v16.3/postgrest-v16.3-linux-static-x86-64.tar.xz
```
3.	Extract the downloaded package:
```bash
tar xJf postgrest-v16.3-linux-static-x86-64.tar.xz
```

4.	Verify the PostgREST installation:
```bash
./postgrest -h
```

If the installation is successful, the command will display the PostgREST version and the available command-line options. The PostgREST binary can be executed from the current directory or copied to a system directory such as /usr/local/bin on Linux to make it available system-wide.

## Schema creation
