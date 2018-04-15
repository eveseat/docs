![SeAT](https://i.imgur.com/aPPOxSK.png)

# console change logs
Generated with: `git log --pretty=format:"%h%>(12)%ad %<(7)%aN%d %s" --date=short`

### 1.0-pre-alpha
```
fe0da9e  2015-11-27 Leon Jacobs (tag: 1.0-pre-alpha) Update README
05e59b3  2015-11-20 Leon Jacobs Add a cache clearing command
41081d9  2015-11-03 Leon Jacobs Add the UpdateSDE command
9af76fb  2015-10-02 Leon Jacobs use ::class format
7e0bae5  2015-10-02 Leon Jacobs Add seat:admin:reset command
9f4e15f  2015-09-28 Leon Jacobs Update to match eveseat/eveapi model refacto
ee48a61  2015-09-24 Leon Jacobs Add services version lookup
5d7ca5f  2015-09-24 Leon Jacobs Add a 'live' status command
bcd1feb  2015-09-24 Leon Jacobs Add command to update a single key
ee43dc5  2015-09-24 Leon Jacobs Add seat:keys:show command
f72ba13  2015-09-24 Leon Jacobs Style fix
b4bcc04  2015-09-24 Leon Jacobs Add the console.config and update version command
8fe529d  2015-09-24 Leon Jacobs Refactor updater commands to the Eve\ namespace
cc92c10  2015-09-23 Leon Jacobs Ensure only enabled keys are queued for updates
8f93faf  2015-09-23 Leon Jacobs Update to new eveapi version information location
fa5513d  2015-09-23 Leon Jacobs Queue Jobs using the UpdatePublic Job
887b89c  2015-09-16 Leon Jacobs Update readme with badges
74f82f5  2015-09-16 Leon Jacobs Prepare for packagist publish.
a782121  2015-09-04 Leon Jacobs Add the command to queue updates for API keys
14edaa8  2015-09-04 Leon Jacobs Make all commands honor the Job Container
12538ef  2015-09-03 Leon Jacobs Add command for the Api CallList update
31e0d06  2015-08-30 Leon Jacobs Add EVE Map Update command
20aa008  2015-08-29 Leon Jacobs Add eve:update-eve command
b9b7545  2015-08-29 Leon Jacobs Add the EveUpdateServerStatus command
c978b94  2015-08-29 Leon Jacobs Add the add:job command for testing
c01ddd9  2015-08-28 Leon Jacobs Start the Console package
f42ac27  2015-08-28 Leon Jacobs first commit
```
### 1.0.0
```
8cc907d  2015-11-28 Leon Jacobs (tag: 1.0.0) Update required eveseat package versions
81fde9f  2015-11-28 Leon Jacobs Version Bump
```
### 1.0.1
```
2a2a350  2015-11-30 Leon Jacobs (tag: 1.0.1) Add web and api versions
```
### 1.0.2
```
65f650d  2015-12-01 Leon Jacobs (tag: 1.0.2) Versino Bump
```
### 1.0.3
```
0f83a18  2015-12-02 Leon Jacobs (tag: 1.0.3) Version Bump
d0f6d31  2015-12-02 Leon Jacobs Display versions in a table
3d472d4  2015-12-02 Leon Jacobs Add notifications version
```
### 1.0.4
```
338a397  2015-12-04 Leon Jacobs (tag: 1.0.4) Cleanup outputs and sink to a filehandler instead.
```
### 1.0.5
```
7e1d13d  2015-12-07 Leon Jacobs (tag: 1.0.5) Version Bump
b7cac27  2015-12-07 Leon Jacobs Drop guzzle version to match that of phealng
91f2e03  2015-12-07 Leon Jacobs Cleanups
6361651  2015-12-05 Leon Jacobs Add diagnose command
123bc36  2015-12-04 Leon Jacobs Update README.md
```
### 1.0.6
```
3f541b4  2015-12-08 Leon Jacobs (tag: 1.0.6) Version Bump
a49d908  2015-12-08 Leon Jacobs Revert b7cac27ebe4a1de8
```
### 1.0.7
```
18bf548  2015-12-24 Leon Jacobs (tag: 1.0.7) Version Bump
8934a36  2015-12-24 Leon Jacobs Specify versions with ~
```
### 1.0.8
```
6a6d779  2015-12-26 Leon Jacobs (tag: 1.0.8) Version Bump
643479f  2015-12-26 Leon Jacobs Update diagnose with some more useful debug info
0132b4e  2015-12-26 Leon Jacobs Add Github version lookup
```
### 1.0.9
```
68e5638  2015-12-29 Leon Jacobs (tag: 1.0.9) Version Bump
8b3aef9  2015-12-29 Leon Jacobs Use `class` notation
```
### 1.0.10
```
8fb5ad1  2016-01-26 Leon Jacobs (tag: 1.0.10) Version Bump
3e1dca5  2016-01-26 Leon Jacobs Update copyright
d4b2b6f  2016-01-06 Leon Jacobs Code style fix
```
### 1.0.11
```
53fda6e  2016-04-29 Leon Jacobs (tag: 1.0.11) Version Bump
bb9841c  2016-04-29 Leon Jacobs Fix eveseat/seat#83 by ensuring seat:admin:reset recovers admin roles
```
### 1.0.12
```
a6e5e54  2016-05-05 Leon Jacobs (tag: 1.0.12) Version Bump
0c9f1c7  2016-05-01 Leon Jacobs Add a console command to set the admin email address
```
### 1.0.13
```
974cfad  2016-07-23 Leon Jacobs (tag: 1.0.13) Version Bump
f3f44dc  2016-07-23 Leon Jacobs Add analytics hit information.
161cdee  2016-07-22 Leon Jacobs Add ClearExpired command
a87e8d0  2016-07-18 Leon Jacobs Add `seat:queue:clear-expired` command.
```
### 1.0.14
```
57132cf  2016-07-26 Leon Jacobs (tag: 1.0.14) Version Bump
8c9abec  2016-07-26 Leon Jacobs Fix eveseat/seat#127 by removing string concatenation in Class property
```
### 1.0.15
```
43fc0b2  2016-07-26 Leon Jacobs (tag: 1.0.15) Version Bump
a1da1a0  2016-07-26 Leon Jacobs Remove string concatenation causing systax errors
```
### 1.0.16
```
c356fd3  2016-07-27 Leon Jacobs (tag: 1.0.16) Version Bump
ebbebf2  2016-07-27 Leon Jacobs Default to 6 hours to reap jobs
40707ef  2016-07-27 Leon Jacobs Add missing trait
```
### 1.0.17
```
950768a  2016-10-13 Leon Jacobs (tag: 1.0.17) Version bump
5b6c15c  2016-08-26 Leon Jacobs Escape any special characters a password.
ffc04bf  2016-08-25 Leon Jacobs Code style and language fixes
bf32149  2016-08-25 Leon Jacobs Merge pull request #1 from warlof/master
5c7f85b  2016-08-23 elfaus  add a control for SDE version in order to avoid downloading it again allow the user to force an SDE re-installation using --force argument
```
### 2.0.0-alpha1
```
81c6385  2016-11-26 Leon Jacobs (tag: 2.0.0-alpha1) Update composer for 2.0 packages and version 2.0.0-alpha1
2952e40  2016-11-05 Leon Jacobs Code formatting fixes
9d189dc  2016-11-03 Leon Jacobs Rename Pillow to AccessManager and update calls argument list
cebd0ef  2016-10-29 Leon Jacobs Update to match new class names in eveapi repo
e1a95e9  2016-10-27 Leon Jacobs Correctly identify the current user running the command.
e83fb0e  2016-10-23 Leon Jacobs Use `dispatch()` helper instead of Trait
953d790  2016-10-23 Leon Jacobs Update PHP, Laravel & Guzzle dependencies
```
### 2.0.0-alpha2
```
a01282a  2016-11-26 Leon Jacobs (tag: 2.0.0-alpha2) Drop minimum stability, add prefer-stable and bump to 2.0.0-alpha2.
```
### 2.0.0
```
6f57fa6  2016-12-08 Leon Jacobs (tag: 2.0.0) Version Bump! 2.0.0! ⚡️
05ec623  2016-11-29 Leon Jacobs Formatting and style fixes.
e5eee71  2016-11-28 Leon Jacobs Ensure the admin user is enabled when resetting the password.
```
### 2.0.1
```
352d6ae  2016-12-21 Leon Jacobs (tag: 2.0.1) Version Bump
4112603  2016-12-21 Leon Jacobs Slightly increase wait time
7cba4f1  2016-12-21 Leon Jacobs Add `seat:keys:tail` command
868adc3  2016-12-12 Leon Jacobs Make clearing the pheal cache require a flag.
```
### 2.0.2
```
9c80eee  2016-12-22 Leon Jacobs (tag: 2.0.2) Version bump
ca24d69  2016-12-22 Leon Jacobs Give the server status call priority
```
### 2.0.3
```
5e0fd35  2017-01-12 Leon Jacobs (tag: 2.0.3) Version Bump
a0dc02d  2017-01-04 Leon Jacobs Update styleci config
197d773  2017-01-02 Leon Jacobs Apply fixes from StyleCI (#2)
3774d3f  2017-01-02 Leon Jacobs Add StyleCI badge
aa138a7  2017-01-02 Leon Jacobs Add StyleCI Configuration
429b084  2017-01-01 Leon Jacobs Style fixes
```
### 2.0.4
```
8d09f93  2017-01-26 Leon Jacobs (HEAD -> 2.x, tag: 2.0.4, origin/master, origin/HEAD, origin/2.x, master) Version Bump
d4d1160  2017-01-25 mrurb   Fixed UpdateSde not using port (#3)
a9a25d9  2017-01-20 Leon Jacobs Add codeclimate configuration
```
