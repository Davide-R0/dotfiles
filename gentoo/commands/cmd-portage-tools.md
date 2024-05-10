# General tool Portage

## Gentoolkit
Package: `app-portage/gentoolkit`

### equery 
Parameter for `equery -`:
- `u`	show USE-flags of package
- `d`	dependencies
- `g`	dependency graph
- `b`	package origin of specific file
- `s`	size
- `w`	path

#### List all package installed
``` shell
equery list '*'
```

#### See a package weight
``` shell
equery size PackageName
```

#### Verify integrity
``` shell
equery check PackageName
```

#### Show package dependency
List package that depends on `PackageName`
``` shell
equery depends PackageName
```
Graph all dependency:
``` shell
equery depgraph PackageName
```

#### List files installed by a package
``` shell 
equery files --tree PackageName
```

#### Search package that use a specific USE flags
``` shell
equery hasuse flags1 flags2 ...
```

#### keyword show
``` shell
equery keywords PackageName
```

#### search package that belongs to a program
``` shell
equery belongs -e ProgramName
```

#### List package available for a (even partial) name of a package
``` shell
equery list -po PackageName 
```

#### More information (metadata) about a package
``` shell
equery meta PackageName
```
Description:
``` shell
equery meta --description PackageName
```

#### List available USE flags for a package
``` shell
equery uses PackageName
```

### eclean
Clean distfiles:
``` shell
eclean distfiles
```
Clean packages
``` shell
eclean packages
```

### epkginfo
Is a shortcut of `euqery meta`

### eshowkw
Is a shortcut of `equery keywords`

### euse
Show the current active USE flags:
``` shell
euse -a
```

### revdep-rebuild
Check package that broke in case of update. Pretend:
``` shell
revdep-rebuild -p
```
to rebuild:
``` shell
sudo revdep-rebuild
```

## Eselect
Package: `app-admin/eselect`

Useful command:
``` shell
eselect [key] help
```

Different possibility for `[key]`:
- `editor`  set default editor 
- `env`     
- `gcc`     set version of `gcc`
- `kernel`  set kernel version symlink of `/usr/src/linux`
- `locale`  set `LANG` env variable, set system language, date formats, ecc...
- `modules`
- `news`    read Gentoo news
- `pager`
- `profile` set symlink of `make.profile`
- `rc`      manage `open-rc` scripts
- `visual`  


