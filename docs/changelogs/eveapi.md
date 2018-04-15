![SeAT](https://i.imgur.com/aPPOxSK.png)

# eveapi change logs
Generated with: `git log --pretty=format:"%h%>(12)%ad %<(7)%aN%d %s" --date=short`

### 1.0-pre-alpha
```
debc408  2015-11-27 Leon Jacobs (tag: 1.0-pre-alpha) Update README
3ab3bb9  2015-11-27 Leon Jacobs Populate $fillable properties to include corpIDs
7577325  2015-11-27 Leon Jacobs Small refactor to reduce code duplication
403b894  2015-11-27 Leon Jacobs Add method to get a corporationID
f116fbe  2015-11-25 Leon Jacobs Fix up testing by allowing the access bit to be set in the constructor
18e3967  2015-11-21 Leon Jacobs Actually set the configured instance
18522f4  2015-11-21 Leon Jacobs Load access definitions directly from the config
d9c3d8f  2015-11-21 Leon Jacobs Resolve PhealNG out of the IoC
3e75254  2015-10-30 Leon Jacobs Increase field size
cc1823d  2015-10-05 Leon Jacobs Add User relationship
2c3f4a6  2015-09-27 Leon Jacobs Change Case
411e46c  2015-09-27 Leon Jacobs Refactor Models into categorized namespaces
0940ea9  2015-09-24 Leon Jacobs Make Jobs aware of the Pheal\ConnectionException
acf0a53  2015-09-24 Leon Jacobs Write a log entry if the JobTracker lookup failed
bc9b4ce  2015-09-24 Leon Jacobs Dont try and get Courier contracts items
10f496a  2015-09-24 Leon Jacobs Dont type hint the exception type, as any exception should get here.
d1d8555  2015-09-24 Leon Jacobs Cater for the strange AccountStatus call access.
318de50  2015-09-24 Leon Jacobs Rate Limit requests p/s to remain under 30 p/s
dfcd9c6  2015-09-24 Leon Jacobs Jobs can now be assigned to a queue for priority.
5b8cd0b  2015-09-24 Leon Jacobs Prevent an array_merge() attempt on NULL
31f1af0  2015-09-24 Leon Jacobs Allow for granular update worker control
ca9ff3e  2015-09-23 Leon Jacobs Collapse KillMail Attacker, Detail and Items tables.
16e75b5  2015-09-23 Leon Jacobs Split configs up and update the Service Provider
1639d2b  2015-09-23 Leon Jacobs Move load_workers to the JobTracker Trait
827f34a  2015-09-23 Leon Jacobs Small refactor to remove duplicate code starting workers.
66bb167  2015-09-23 Leon Jacobs Code Style fixes
9701167  2015-09-23 Leon Jacobs Log failed jobs to the general log.
5c76f57  2015-09-23 Leon Jacobs Fix Line Seperator to LF
e9eb32d  2015-09-23 Leon Jacobs Add sample XML
2712ac3  2015-09-23 Leon Jacobs Remove unnecessary leading \
acd5c1b  2015-09-23 Leon Jacobs Add Corporation WalletTransaction Update worker
42e8355  2015-09-22 Leon Jacobs Add more transaction uniqueness
b4b5c01  2015-09-22 Leon Jacobs Add missing accountKey arg
c27e7d3  2015-09-22 Leon Jacobs Add Corporation Wallet Journal Update worker
fa876b7  2015-09-22 Leon Jacobs Add primary key for updates
0117329  2015-09-22 Leon Jacobs Add Corporation Titles Update worker
30162a2  2015-09-22 Leon Jacobs Add StarbaseList and Detail Update workers
821b63b  2015-09-22 Leon Jacobs Add Corporation Standing Update worker
ccfa8b6  2015-09-21 Leon Jacobs Add Corporation Shareholders Update worker
6478410  2015-09-21 Leon Jacobs Add Corporation MemberSecurityLog Update worker
84cabb4  2015-09-21 Leon Jacobs Add Corporation MemberTracking Update worker
f860322  2015-09-21 Leon Jacobs Only set titles if the API response had some
eac6568  2015-09-21 Leon Jacobs Add Corporation MemberSecurity Update Worker
92cb2a0  2015-09-21 Leon Jacobs Add Corporation MemberMedals Update worker
adb06db  2015-09-21 Leon Jacobs Add Corporation Medals Update worker
799246d  2015-09-21 Leon Jacobs Add Corporation Market Order Update worker
91b9b8f  2015-09-21 Leon Jacobs Add Corporation KillMail Update worker
422cc28  2015-09-21 Leon Jacobs Add Corporation IndustryJobs Update worker
a8c58c5  2015-09-21 Leon Jacobs Add Corporation Customs Offices Update worker
2bfb7cc  2015-09-20 Leon Jacobs Add Corporation Sheet Update worker
e91a78f  2015-09-20 Leon Jacobs Add Corporation Contract/Items Update worker
c8ba721  2015-09-20 Leon Jacobs Add Corporation ContactList update worker
8042cb9  2015-09-20 Leon Jacobs Update comment
9876ed2  2015-09-19 Leon Jacobs Add Corporation Locations Update worker
4949d96  2015-09-19 Leon Jacobs Add method to find celestials closest to an x,y,z
d7f3844  2015-09-19 Leon Jacobs Add the Corporation Assets Update worker
367d83d  2015-09-18 Leon Jacobs Add Corporation Account Balance worker
85b7ed4  2015-09-18 Leon Jacobs Slightly increase possible value
a02f4f6  2015-09-18 Leon Jacobs Add helper to determine corpID for corp keys
942ee79  2015-09-18 Leon Jacobs Get a fresh instance of the model as it just updated
aaa4e2b  2015-09-18 Leon Jacobs Use relation to get type instead of a new query
0cef16e  2015-09-18 Leon Jacobs Code Style Fixes
3127104  2015-09-18 Leon Jacobs Optimize a few updater workers, fix comments and styling
ed350b6  2015-09-18 Leon Jacobs Check if api_info is available first.
3aabc11  2015-09-18 Leon Jacobs Add EVEAPI error handling
e38f15a  2015-09-18 Leon Jacobs Check if the info relation exists before using
eda56f2  2015-09-17 Leon Jacobs Add test for accessMask checking
efa6bd3  2015-09-17 Leon Jacobs Implement CanCheck to check API key accessmasks
076a608  2015-09-16 Leon Jacobs Improve readability of error output
c327e62  2015-09-16 Leon Jacobs Bump dependencies to stable versions only
d3690c0  2015-09-16 Leon Jacobs Update class comments
d377c46  2015-09-16 Leon Jacobs Move list of update classes to a config file
55c3d31  2015-09-16 Leon Jacobs Fixup tests since the phealng optimization
d0f93b4  2015-09-16 Leon Jacobs Optimize PhealNG usage.
6a0182e  2015-09-15 Leon Jacobs Add Bookmarks Update worker
5cc2f16  2015-09-14 Leon Jacobs Update Badges
72f4a40  2015-09-14 Leon Jacobs Update License
62abf5d  2015-09-14 Leon Jacobs Add Chat Channels Update worker
b1c1890  2015-09-14 Leon Jacobs Fix reference to transactions element
9d17c5e  2015-09-14 Leon Jacobs Add Utils test
effef96  2015-09-14 Leon Jacobs Update License
55a0f70  2015-09-14 Leon Jacobs Use 'hash' as primary key
9a3a1e3  2015-09-14 Leon Jacobs Add Wallet Transactions Update worker
8149688  2015-09-14 Leon Jacobs Add the Wallet Journal update worker
7fb983f  2015-09-14 Leon Jacobs Add Calendar Events Update worker
fc553d5  2015-09-14 Leon Jacobs Add Standings Update worker
b06989c  2015-09-14 Leon Jacobs Add SkillQueue Update worker
faf93b0  2015-09-14 Leon Jacobs Add SkillInTraining Update worker
4ca03ab  2015-09-14 Leon Jacobs Add Character Research Update worker
532b75b  2015-09-14 Leon Jacobs Add Character Market Orders update worker
4d2baeb  2015-09-13 Leon Jacobs Add Planetary Related Update workers
9f82357  2015-09-13 Leon Jacobs Add Character Notification Update workers
985ec34  2015-09-12 Leon Jacobs Add character mailing lists update worker
9a1da2f  2015-09-12 Leon Jacobs Add MailMessage Update worker
fdddcec  2015-09-12 Leon Jacobs Increase size of output column
81bfd5e  2015-09-11 Leon Jacobs Add supporting files for Char KillMail Updater
ea775fd  2015-09-11 Leon Jacobs Add Character KillMail Update worker
53b3b92  2015-09-11 Leon Jacobs Add CharacterInfo Update worker
259f2c6  2015-09-09 Leon Jacobs Add Industry Update worker
4cb4c79  2015-09-09 Leon Jacobs Fix a few small keying issues
75718fe  2015-09-07 Leon Jacobs Add Contract and ContractItems update workers
bb8fdbd  2015-09-07 Leon Jacobs Add Contact Notifications update worker
ae67622  2015-09-07 Leon Jacobs Add ContactList update worker
576e022  2015-09-06 Leon Jacobs Add complete CharacterUpdate worker
77ed8ca  2015-09-05 Leon Jacobs Bump default cURL timeout to 60s
6d15331  2015-09-05 Leon Jacobs Fix issue causing member corp allianceID to be 0
08ef47a  2015-09-05 Leon Jacobs Add the Character AssetsList Updater
0a0f959  2015-09-05 Leon Jacobs Add AccountBalance Update worker
5a65242  2015-09-05 Leon Jacobs Fix up the relationship keys
b12f246  2015-09-05 Leon Jacobs Add a relationship between API Keys and Characters
f20b464  2015-09-05 Leon Jacobs Prevent an errored job from being marked as Done
13ed536  2015-09-05 Leon Jacobs Add AccountStatus sample XML
b26fcf2  2015-09-05 Leon Jacobs Add AccountStatus Updater
93952a3  2015-09-05 Leon Jacobs Update Checker to queue jobs based on key type
c61dd09  2015-09-05 Leon Jacobs Style and docblock fixes
db60993  2015-09-05 Leon Jacobs Abstract some of the repeated Trait usage
7124c77  2015-09-04 Leon Jacobs Constrain the character removals to the key
b5f2f61  2015-09-04 Leon Jacobs Remove unused PhealException
b0063c7  2015-09-04 Leon Jacobs Start the Key pickup worker
3e97b6c  2015-09-04 Leon Jacobs Return the object when setting the key/vcode
99081b7  2015-09-04 Leon Jacobs Group API Tests to be easily excluded by PHPUnit
207a33d  2015-09-04 Leon Jacobs Add the Job Container to resolve Job information
598ed88  2015-09-04 Leon Jacobs Remove unused DispatchesJobs trait
93eec75  2015-09-03 Leon Jacobs Add the API CallList Updater and Test
79f4a16  2015-09-02 Leon Jacobs Add Code Climate
f881d47  2015-09-02 Leon Jacobs Update README
aafe40f  2015-09-02 Leon Jacobs Update travis-ci to include newer PHP and HHVM
d21e557  2015-09-02 Leon Jacobs Add Travis-CI config
3da6a8e  2015-09-02 Leon Jacobs Add tests for the currently implemented calls
21a3f2d  2015-08-31 Leon Jacobs CS Fixes
82c0f51  2015-08-31 Leon Jacobs Add Test to validate ServerStatus API Response
1ee3bb0  2015-08-31 Leon Jacobs Small namespace change for the test
21be320  2015-08-31 Leon Jacobs Start Testing! :)
6d0ed85  2015-08-31 Leon Jacobs Throw an exception if an api key is empty
52ad9b7  2015-08-30 Leon Jacobs Add Map Jumps Update worker
6c4bc86  2015-08-30 Leon Jacobs Add Map Kills update worker
4720ae1  2015-08-30 Leon Jacobs Fix job to actually update if something changes too
6d39cb2  2015-08-30 Leon Jacobs Update Models defining new primary keys
377428b  2015-08-30 Leon Jacobs Modify Migration Indexes
c753ad1  2015-08-30 Leon Jacobs Add Map Sovereignty Update workers
187b336  2015-08-30 Leon Jacobs Add AllianceList update
8fff877  2015-08-29 Leon Jacobs Add ConquerableStationList updater
a75c66e  2015-08-29 Leon Jacobs Add eve/errorlist API call
b02dc11  2015-08-29 Leon Jacobs Add Eve RefTypes API Call
9c61de8  2015-08-29 Leon Jacobs Move Jobs error handling to a trait
8bc8a64  2015-08-29 Leon Jacobs Implement the Job Tracker
0d0ab93  2015-08-29 Leon Jacobs Add a job manager
ca0a6d7  2015-08-29 Leon Jacobs Add generated docblocks
086ebb5  2015-08-29 Leon Jacobs Complete ServerStatus Update
8991564  2015-08-29 Leon Jacobs Start core logic and add server status checker
b6991b9  2015-08-29 Leon Jacobs Start a few things to test job workers
40d4948  2015-08-28 Leon Jacobs Start composer package
af4f12f  2015-08-28 Leon Jacobs first commit
```
### 1.0.0
```
a49216a  2015-11-28 Leon Jacobs (tag: 1.0.0) Version Bump
```
### 1.0.1
```
f4d133a  2015-12-07 Leon Jacobs (tag: 1.0.1) Version Bump
6db0044  2015-12-07 Leon Jacobs Update to Pheal2.3 and use the Guzzle fetcher
4354a90  2015-12-07 Leon Jacobs Reload the info relationship on a key to update accessMask
47ddd2b  2015-12-04 Leon Jacobs Update README.md
```
### 1.0.2
```
dc612d9  2015-12-13 Leon Jacobs (tag: 1.0.2) Version Bump
a8bcd62  2015-12-13 Leon Jacobs Compile a sane user agent for eveapi xml requests
6eced6a  2015-12-13 Leon Jacobs Change - to _
05378b6  2015-12-12 Leon Jacobs Catch the ConnectionException when checking keys
fa6bcf6  2015-12-12 Leon Jacobs Decrement the counters when checking key types
78441a9  2015-12-12 Leon Jacobs Dont increment past the limit
ff3df0a  2015-12-12 Leon Jacobs Add ability to check if the EVE XMLAPI is down.
3ec7598  2015-12-12 Leon Jacobs Add primary key
f954257  2015-12-12 Leon Jacobs Add primary key.
```
### 1.0.3
```
53c168f  2015-12-17 Leon Jacobs (tag: 1.0.3) Add check to job_ids and version bump
```
### 1.0.4
```
7be3801  2015-12-18 Leon Jacobs (tag: 1.0.4) Version Bump
6302a17  2015-12-18 Leon Jacobs Handle some HTTP response codes for expired keys
```
### 1.0.5
```
03101f9  2015-12-20 Leon Jacobs (tag: 1.0.5) Version Bump
5562f03  2015-12-20 Leon Jacobs Add corporation bookmarks updater
17c7c41  2015-12-18 Leon Jacobs Resolve the closest celestials for bookmarks
c7bef60  2015-12-18 Leon Jacobs Only resolve to items that have names
856f66f  2015-12-18 Leon Jacobs Add channel relations
```
### 1.0.6
```
74dcedb  2015-12-24 Leon Jacobs (tag: 1.0.6) Version Bump
fb2e473  2015-12-24 Leon Jacobs Set composer versions using ~
f9fdfb5  2015-12-24 Leon Jacobs Merge pull request #4 from warlof/shareholders
fd53795  2015-12-24 Leon Jacobs Keep track of the closest distance.
9840802  2015-12-24 elfaus  (origin/pr/4) Provide a fix to eveseat/seat issue #21
69e8c3b  2015-12-23 Leon Jacobs Merge pull request #3 from warlof/contactslabels
173f57c  2015-12-23 elfaus  (origin/pr/3) Provide a fix to eveseat/seat issue #5
```
### 1.0.7
```
f816c1d  2015-12-28 Leon Jacobs (tag: 1.0.7) Version Bump
dd72510  2015-12-28 Leon Jacobs Default to an Unknown system
1e41a94  2015-12-28 Leon Jacobs Default to the solarsystemid instead of null
da049c7  2015-12-28 Leon Jacobs Fix eveseat/seat#8 by checking if the body exists before insert
ff48a73  2015-12-27 Leon Jacobs Add the CustomsOfficeLocations API updater
601eb36  2015-12-24 Leon Jacobs Specify phealng version with a ~
a08e970  2015-12-24 Leon Jacobs Remove specific minor version.
a93f674  2015-12-24 Leon Jacobs Bump minimum PHP version
```
### 1.0.8
```
eac8500  2016-01-03 Leon Jacobs (tag: 1.0.8) Version Bump
83cb845  2016-01-03 Leon Jacobs Fix eveseat/seat#37
```
### 1.0.9
```
ab271fa  2016-01-26 Leon Jacobs (tag: 1.0.9) Version Bump
c285f7d  2016-01-26 Leon Jacobs Update copyright
e741457  2016-01-06 Leon Jacobs Code style fixes
```
### 1.0.10
```
3a5c6cf  2016-01-27 Leon Jacobs (tag: 1.0.10) Version Bump
6995d17  2016-01-27 Leon Jacobs Fix eveseat/seat#52 by searching by refTypeID to update
```
### 1.0.11
```
ab985bd  2016-02-09 Leon Jacobs (tag: 1.0.11) Version Bump
d4d4f50  2016-02-09 Leon Jacobs Dont disable on HTTP 403. Too many false positives.
```
### 1.0.12
```
56c8444  2016-03-01 Leon Jacobs (tag: 1.0.12) Version Bump
00d8697  2016-03-01 Leon Jacobs Catch the PhealException to handle XML parsing issues
ab00f40  2016-02-29 Leon Jacobs Temporarily fix eveseat/seat#71 by catching the PhealException
20f00e9  2016-02-29 Leon Jacobs Mark jobs as done in the case of errors.
```
### 1.0.13
```
8f8e0b1  2016-04-29 Leon Jacobs (tag: 1.0.13) Version Bump
e9db18e  2016-04-29 Leon Jacobs Add a block if an admin contact email has not been set.
459d353  2016-04-28 Leon Jacobs Add the new char/Clones and char/Skills endpoints as updaters
ccc7a08  2016-04-28 Leon Jacobs Fix XSD as 2 new endpoints have been added, bumping accessMask to long type
85b21b0  2016-04-28 Leon Jacobs Disable keys that respond with HTTP 403 in APIKeyInfo
```
### 1.0.14
```
c812028  2016-05-02 Leon Jacobs (tag: 1.0.14) Version Bump
55f1ade  2016-05-02 Leon Jacobs Fix eveseat/seat#100 by finding by primary key only.
4451000  2016-05-01 Leon Jacobs Fix eveseat/seat#99 by cleaning up after a key is deleted
```
### 1.0.15
```
c02f338  2016-07-10 Leon Jacobs (tag: 1.0.15) Version Bump
3356cd0  2016-07-09 Leon Jacobs Fix method comment
bd3e928  2016-07-09 Leon Jacobs Handle the `failed()` method on jobs by updating the `JobTracking`.
```
### 1.0.16
```
804bbdc  2016-07-23 Leon Jacobs (tag: 1.0.16) Version Bump
cfdf20c  2016-07-23 Leon Jacobs Report Exception types that have occured.
69de2a2  2016-07-18 Leon Jacobs Add timestamp to error.
87efa4b  2016-07-18 Leon Jacobs Add model for the failed_jobs table
```
### 1.0.17
```
d9af10e  2016-07-23 Leon Jacobs (tag: 1.0.17) Version Bump
1267346  2016-07-23 Leon Jacobs Remove DispatchesJobs trait and use Bus Facade
```
### 1.0.18
```
27bc174  2016-10-14 Leon Jacobs (tag: 1.0.18) Version Bump
ca27d33  2016-08-25 Leon Jacobs Fix imports, comments and codestyle
df05261  2016-08-25 johnnysplunk CharacterInfo API access mask compatability and legacy deprecation (#6)
4123994  2016-08-25 Leon Jacobs Add missing comment
d33d2cf  2016-08-25 Leon Jacobs Merge pull request #5 from warlof/paid-until
ddf666f  2016-08-04 elfaus  (origin/pr/5) adding api_key_status into apiKey relation
```
### 2.0.0-alpha1
```
53a181a  2016-11-26 Leon Jacobs (tag: 2.0.0-alpha2, tag: 2.0.0-alpha1) Update composer for 2.0 packages and version 2.0.0-alpha1
edb45bd  2016-11-25 Leon Jacobs Add a relationship between message headers and bodies.
9983367  2016-11-25 Leon Jacobs Allow for notification on the character sheet
271aa73  2016-11-06 Leon Jacobs Fix type hint to an int instead of string
59a83e5  2016-11-06 Leon Jacobs Move the `Affiliation` updater to a character specific class.
12b0999  2016-11-06 Leon Jacobs Add CharacterAffiliation updater. This is prep for the intel module.
b68cd19  2016-11-05 Leon Jacobs Code formatting fixes
79e30bd  2016-11-04 Leon Jacobs Use logger() helper
34ac286  2016-10-29 Leon Jacobs Extract some error handling up to the base abstract class
77172ec  2016-10-29 Leon Jacobs Cleanup methods, add type hints and remove unused code
f4af243  2016-10-29 Leon Jacobs Make the integer migration a little more understandable.
66c6bba  2016-10-29 Leon Jacobs Add more contact related fields to the integer fixes
c083f61  2016-10-29 Leon Jacobs Start refactoring the job tracking and error handling from a Trait to Class
61af28c  2016-10-27 Leon Jacobs Add migration to fix text sizes
946ee47  2016-10-27 Leon Jacobs Fix labelMask integer sizes.
8699992  2016-10-26 Loïc LEUILLIOT fix migration by disabling sql modes (#7)
bcd15e0  2016-10-24 johnnysplunk Fix for RefTypesModel->refTypeName not updating properly. (#8)
dffd1c9  2016-10-23 Leon Jacobs Pass the the exception thrown into the `failed()` method.
e07f36b  2016-10-20 Leon Jacobs Fix schemas to work with MySQL in strict mode.
58da2c8  2016-10-17 Leon Jacobs Require PHP7 and Laravel 5.3
8071dce  2016-10-17 Leon Jacobs Set the primary key type
91e4b2a  2016-10-17 Leon Jacobs Fix Jobs and dispatcher to accommodate L5.3 changes
e908f11  2016-10-17 Leon Jacobs Rename `lists()` to `pluck()`
```
### 2.0.0-alpha2
```

```
### 2.0.0
```
06810af  2016-12-08 Leon Jacobs (tag: 2.0.0) Version Bump! 2.0.0! ⚡️
0227052  2016-12-08 Leon Jacobs Update fields to bigInt in light of the recent CCP announcement.
6d62a2d  2016-12-08 Leon Jacobs Fix typos and remove ambogous __CLASS__ reference
3123010  2016-12-08 Leon Jacobs Lazily utf8 encode mail bodies
8496356  2016-12-08 Leon Jacobs Add doctrine/dbal as needed by some migrations.
f4ad084  2016-11-29 Leon Jacobs First iteration of adding worker constraints.
92e2d5d  2016-11-29 Leon Jacobs Improve generic error logging to be aware of the fact that no longer have context of the job_tracker.
cd7b4f8  2016-11-26 Leon Jacobs Drop minimum stability, add prefer-stable and bump to 2.0.0-alpha2.
```
### 2.0.1
```
59f7f5f  2016-12-10 Leon Jacobs (tag: 2.0.1) Version Bump
199741d  2016-12-10 Leon Jacobs Fix eveseat/seat#153 by casting the string to an int.
0ea98a4  2016-12-09 Leon Jacobs Update Travis to only allow PHP 7 now.
```
### 2.0.2
```
c11c64a  2016-12-11 Leon Jacobs (tag: 2.0.2) Version bump
c62c2ed  2016-12-11 Leon Jacobs Increase the reason field length for corp_member_medals.
```
### 2.0.3
```
b6000b7  2016-12-12 Leon Jacobs (tag: 2.0.3) Version Bump
ec9368b  2016-12-12 Leon Jacobs Fix eveseat/seat#155 by increasing column size.
```
### 2.0.4
```
40d5a34  2016-12-13 Leon Jacobs (tag: 2.0.4) Version Bump
737f28c  2016-12-13 Leon Jacobs Experimental performance patch by making the PhealFetcher a singleton.
f00190d  2016-12-12 Leon Jacobs Remove the Pheal Rate limit setting and use the defaults.
```
### 2.0.5
```
d1658a3  2016-12-21 Leon Jacobs (tag: 2.0.5) Version Bump
4072f01  2016-12-21 Leon Jacobs Update travis yaml with root package version
70b4f66  2016-12-21 Leon Jacobs Remove useless log entry
60af828  2016-12-21 Leon Jacobs Formatting & typo fixes.
8f3ce57  2016-12-21 Leon Jacobs Allow for the joblog to be disabled via a config setting.
1c8516f  2016-12-20 Leon Jacobs Fix typo
826f3cf  2016-12-20 Leon Jacobs Add update worker job logging
```
### 2.0.6
```
fe3fd7a  2016-12-22 Leon Jacobs (tag: 2.0.6) Version Bump
0f6cb57  2016-12-22 Leon Jacobs Log constraints to the joblog
```
### 2.0.7
```
7ba4970  2016-12-28 Leon Jacobs (tag: 2.0.7) Version Bump
d370866  2016-12-28 Leon Jacobs Use the same queue priority as the parent job.
260b854  2016-12-28 Leon Jacobs Update reason for disabling key.
e05a24a  2016-12-28 Leon Jacobs Add a grace error count before disabling API keys
296e24f  2016-12-28 Leon Jacobs Dont update Courier ContractsItems
2fae54f  2016-12-28 Leon Jacobs Add link to docs for more information.
```
### 2.0.8
```
aa25f97  2017-01-01 Leon Jacobs (tag: 2.0.8) Version Bump
3cad74d  2017-01-01 Leon Jacobs Fix eveseat/seat#159 by checking if the titles isset first.
```
### 2.0.9
```
73a778f  2017-01-12 Leon Jacobs (tag: 2.0.9) Version Bump
f7b9b8e  2017-01-12 freedenizen Character Assets are now pulled recursively (#12)
91508da  2017-01-12 Leon Jacobs Style fix
fb68a10  2017-01-12 Leon Jacobs Improve queue job handling.
6d945c0  2017-01-11 Leon Jacobs Remove queue tries check.
54b8297  2017-01-04 Leon Jacobs Update styleci config
7d513eb  2017-01-02 Leon Jacobs Apply fixes from StyleCI (#10)
4577068  2017-01-02 Leon Jacobs Add StyleCI configuration & badge
f1a93d2  2017-01-02 Loïc LEUILLIOT avoid primary key duplication if more than a worker is working on the same characterID (#9)
93b2124  2017-01-01 Leon Jacobs Style fixes
```
### 2.0.10
```
57cefe6  2017-02-19 Leon Jacobs (tag: 2.0.10) Version bump
f7d0f14  2017-02-19 Leon Jacobs Dont enable job logging by default
7b80128  2017-01-20 Leon Jacobs Add codeclimate configuration
```
### 2.0.11
```
dc0473a  2017-04-17 Leon Jacobs (tag: 2.0.11) Version Bump
f68007a  2017-04-17 Loïc LEUILLIOT avoid duplicate entry on character notification update (#17)
c80e611  2017-04-17 Loïc LEUILLIOT fix an issue which allow an empty response to be processed (#16)
```
### 2.0.12
```
017729d  2017-05-07 Leon Jacobs (tag: 2.0.12) Version Bump
24e19c1  2017-05-07 Leon Jacobs Remvove characterID & corporationID checks.
```
### 2.0.13
```
e763e48  2017-08-12 Leon Jacobs (tag: 2.0.13, master) Version Bump
8d0eced  2017-08-12 Leon Jacobs Style fixes.
9e36c80  2017-08-12 Loïc LEUILLIOT add industry jobs history to industry job and fix CCP shit on job status (#21)
465e6cf  2017-08-12 Loïc LEUILLIOT optimise dashboard query for top mail badge by adding an index on sentDate (#20)
```
