# Windows setup
Follow this to set the PC up starting from a fresh windows installation. Installations are done using on [chocolatey](https://chocolatey.org/), configs are done by registry changes.


## Automated setup
Install software, configure windows and software, create symlinks:

```
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned  # allow execution of scripts on this system
install.ps1
```


## Manual steps
* Install MS Office


## Optional steps
```
Rename-Computer -NewName "ANDFACE"  # Rename PC
```
