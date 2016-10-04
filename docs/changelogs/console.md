![SeAT](http://i.imgur.com/aPPOxSK.png)

# console change logs
Generated with: `git log --oneline --decorate`

### 1.0.16
```
c356fd3 (tag: 1.0.16) Version Bump
ebbebf2 Default to 6 hours to reap jobs
40707ef Add missing trait
```
### 1.0.15
```
43fc0b2 (tag: 1.0.15) Version Bump
a1da1a0 Remove string concatenation causing systax errors
```
### 1.0.14
```
57132cf (tag: 1.0.14) Version Bump
8c9abec Fix eveseat/seat#127 by removing string concatenation in Class property
```
### 1.0.13
```
974cfad (tag: 1.0.13) Version Bump
f3f44dc Add analytics hit information.
161cdee Add ClearExpired command
a87e8d0 Add `seat:queue:clear-expired` command.
```
### 1.0.12
```
a6e5e54 (tag: 1.0.12) Version Bump
0c9f1c7 Add a console command to set the admin email address
```
### 1.0.11
```
53fda6e (tag: 1.0.11) Version Bump
bb9841c Fix eveseat/seat#83 by ensuring seat:admin:reset recovers admin roles
```
### 1.0.10
```
8fb5ad1 (tag: 1.0.10) Version Bump
3e1dca5 Update copyright
d4b2b6f Code style fix
```
### 1.0.9
```
68e5638 (tag: 1.0.9) Version Bump
8b3aef9 Use `class` notation
```
### 1.0.8
```
6a6d779 (tag: 1.0.8) Version Bump
643479f Update diagnose with some more useful debug info
0132b4e Add Github version lookup
```
### 1.0.7
```
18bf548 (tag: 1.0.7) Version Bump
8934a36 Specify versions with ~
```
### 1.0.6
```
3f541b4 (tag: 1.0.6) Version Bump
a49d908 Revert b7cac27ebe4a1de8
```
### 1.0.5
```
7e1d13d (tag: 1.0.5) Version Bump
b7cac27 Drop guzzle version to match that of phealng
91f2e03 Cleanups
6361651 Add diagnose command
123bc36 Update README.md
```
### 1.0.4
```
338a397 (tag: 1.0.4) Cleanup outputs and sink to a filehandler instead.
```
### 1.0.3
```
0f83a18 (tag: 1.0.3) Version Bump
d0f6d31 Display versions in a table
3d472d4 Add notifications version
```
### 1.0.2
```
65f650d (tag: 1.0.2) Versino Bump
```
### 1.0.1
```
2a2a350 (tag: 1.0.1) Add web and api versions
```
### 1.0.0
```
8cc907d (tag: 1.0.0) Update required eveseat package versions
81fde9f Version Bump
```
### 1.0-pre-alpha
```
fe0da9e (tag: 1.0-pre-alpha) Update README
05e59b3 Add a cache clearing command
41081d9 Add the UpdateSDE command
9af76fb use ::class format
7e0bae5 Add seat:admin:reset command
9f4e15f Update to match eveseat/eveapi model refacto
ee48a61 Add services version lookup
5d7ca5f Add a 'live' status command
bcd1feb Add command to update a single key
ee43dc5 Add seat:keys:show command
f72ba13 Style fix
b4bcc04 Add the console.config and update version command
8fe529d Refactor updater commands to the Eve\ namespace
cc92c10 Ensure only enabled keys are queued for updates
8f93faf Update to new eveapi version information location
fa5513d Queue Jobs using the UpdatePublic Job
887b89c Update readme with badges
74f82f5 Prepare for packagist publish.
a782121 Add the command to queue updates for API keys
14edaa8 Make all commands honor the Job Container
12538ef Add command for the Api CallList update
31e0d06 Add EVE Map Update command
20aa008 Add eve:update-eve command
b9b7545 Add the EveUpdateServerStatus command
c978b94 Add the add:job command for testing
c01ddd9 Start the Console package
f42ac27 first commit
```
