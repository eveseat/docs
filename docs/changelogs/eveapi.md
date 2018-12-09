![SeAT](http://i.imgur.com/aPPOxSK.png)

# eveapi change logs
Generated with: `git log --pretty=format:%h%x09%x09%s`

### 1.0-pre-alpha
```
debc408		Update README
3ab3bb9		Populate $fillable properties to include corpIDs
7577325		Small refactor to reduce code duplication
403b894		Add method to get a corporationID
f116fbe		Fix up testing by allowing the access bit to be set in the constructor
18e3967		Actually set the configured instance
18522f4		Load access definitions directly from the config
d9c3d8f		Resolve PhealNG out of the IoC
3e75254		Increase field size
cc1823d		Add User relationship
2c3f4a6		Change Case
411e46c		Refactor Models into categorized namespaces
0940ea9		Make Jobs aware of the Pheal\ConnectionException
acf0a53		Write a log entry if the JobTracker lookup failed
bc9b4ce		Dont try and get Courier contracts items
10f496a		Dont type hint the exception type, as any exception should get here.
d1d8555		Cater for the strange AccountStatus call access.
318de50		Rate Limit requests p/s to remain under 30 p/s
dfcd9c6		Jobs can now be assigned to a queue for priority.
5b8cd0b		Prevent an array_merge() attempt on NULL
31f1af0		Allow for granular update worker control
ca9ff3e		Collapse KillMail Attacker, Detail and Items tables.
16e75b5		Split configs up and update the Service Provider
1639d2b		Move load_workers to the JobTracker Trait
827f34a		Small refactor to remove duplicate code starting workers.
66bb167		Code Style fixes
9701167		Log failed jobs to the general log.
5c76f57		Fix Line Seperator to LF
e9eb32d		Add sample XML
2712ac3		Remove unnecessary leading \
acd5c1b		Add Corporation WalletTransaction Update worker
42e8355		Add more transaction uniqueness
b4b5c01		Add missing accountKey arg
c27e7d3		Add Corporation Wallet Journal Update worker
fa876b7		Add primary key for updates
0117329		Add Corporation Titles Update worker
30162a2		Add StarbaseList and Detail Update workers
821b63b		Add Corporation Standing Update worker
ccfa8b6		Add Corporation Shareholders Update worker
6478410		Add Corporation MemberSecurityLog Update worker
84cabb4		Add Corporation MemberTracking Update worker
f860322		Only set titles if the API response had some
eac6568		Add Corporation MemberSecurity Update Worker
92cb2a0		Add Corporation MemberMedals Update worker
adb06db		Add Corporation Medals Update worker
799246d		Add Corporation Market Order Update worker
91b9b8f		Add Corporation KillMail Update worker
422cc28		Add Corporation IndustryJobs Update worker
a8c58c5		Add Corporation Customs Offices Update worker
2bfb7cc		Add Corporation Sheet Update worker
e91a78f		Add Corporation Contract/Items Update worker
c8ba721		Add Corporation ContactList update worker
8042cb9		Update comment
9876ed2		Add Corporation Locations Update worker
4949d96		Add method to find celestials closest to an x,y,z
d7f3844		Add the Corporation Assets Update worker
367d83d		Add Corporation Account Balance worker
85b7ed4		Slightly increase possible value
a02f4f6		Add helper to determine corpID for corp keys
942ee79		Get a fresh instance of the model as it just updated
aaa4e2b		Use relation to get type instead of a new query
0cef16e		Code Style Fixes
3127104		Optimize a few updater workers, fix comments and styling
ed350b6		Check if api_info is available first.
3aabc11		Add EVEAPI error handling
e38f15a		Check if the info relation exists before using
eda56f2		Add test for accessMask checking
efa6bd3		Implement CanCheck to check API key accessmasks
076a608		Improve readability of error output
c327e62		Bump dependencies to stable versions only
d3690c0		Update class comments
d377c46		Move list of update classes to a config file
55c3d31		Fixup tests since the phealng optimization
d0f93b4		Optimize PhealNG usage.
6a0182e		Add Bookmarks Update worker
5cc2f16		Update Badges
72f4a40		Update License
62abf5d		Add Chat Channels Update worker
b1c1890		Fix reference to transactions element
9d17c5e		Add Utils test
effef96		Update License
55a0f70		Use 'hash' as primary key
9a3a1e3		Add Wallet Transactions Update worker
8149688		Add the Wallet Journal update worker
7fb983f		Add Calendar Events Update worker
fc553d5		Add Standings Update worker
b06989c		Add SkillQueue Update worker
faf93b0		Add SkillInTraining Update worker
4ca03ab		Add Character Research Update worker
532b75b		Add Character Market Orders update worker
4d2baeb		Add Planetary Related Update workers
9f82357		Add Character Notification Update workers
985ec34		Add character mailing lists update worker
9a1da2f		Add MailMessage Update worker
fdddcec		Increase size of output column
81bfd5e		Add supporting files for Char KillMail Updater
ea775fd		Add Character KillMail Update worker
53b3b92		Add CharacterInfo Update worker
259f2c6		Add Industry Update worker
4cb4c79		Fix a few small keying issues
75718fe		Add Contract and ContractItems update workers
bb8fdbd		Add Contact Notifications update worker
ae67622		Add ContactList update worker
576e022		Add complete CharacterUpdate worker
77ed8ca		Bump default cURL timeout to 60s
6d15331		Fix issue causing member corp allianceID to be 0
08ef47a		Add the Character AssetsList Updater
0a0f959		Add AccountBalance Update worker
5a65242		Fix up the relationship keys
b12f246		Add a relationship between API Keys and Characters
f20b464		Prevent an errored job from being marked as Done
13ed536		Add AccountStatus sample XML
b26fcf2		Add AccountStatus Updater
93952a3		Update Checker to queue jobs based on key type
c61dd09		Style and docblock fixes
db60993		Abstract some of the repeated Trait usage
7124c77		Constrain the character removals to the key
b5f2f61		Remove unused PhealException
b0063c7		Start the Key pickup worker
3e97b6c		Return the object when setting the key/vcode
99081b7		Group API Tests to be easily excluded by PHPUnit
207a33d		Add the Job Container to resolve Job information
598ed88		Remove unused DispatchesJobs trait
93eec75		Add the API CallList Updater and Test
79f4a16		Add Code Climate
f881d47		Update README
aafe40f		Update travis-ci to include newer PHP and HHVM
d21e557		Add Travis-CI config
3da6a8e		Add tests for the currently implemented calls
21a3f2d		CS Fixes
82c0f51		Add Test to validate ServerStatus API Response
1ee3bb0		Small namespace change for the test
21be320		Start Testing! :)
6d0ed85		Throw an exception if an api key is empty
52ad9b7		Add Map Jumps Update worker
6c4bc86		Add Map Kills update worker
4720ae1		Fix job to actually update if something changes too
6d39cb2		Update Models defining new primary keys
377428b		Modify Migration Indexes
c753ad1		Add Map Sovereignty Update workers
187b336		Add AllianceList update
8fff877		Add ConquerableStationList updater
a75c66e		Add eve/errorlist API call
b02dc11		Add Eve RefTypes API Call
9c61de8		Move Jobs error handling to a trait
8bc8a64		Implement the Job Tracker
0d0ab93		Add a job manager
ca0a6d7		Add generated docblocks
086ebb5		Complete ServerStatus Update
8991564		Start core logic and add server status checker
b6991b9		Start a few things to test job workers
40d4948		Start composer package
af4f12f		first commit
```
### 1.0.0
```
a49216a		Version Bump
```
### 1.0.1
```
f4d133a		Version Bump
6db0044		Update to Pheal2.3 and use the Guzzle fetcher
4354a90		Reload the info relationship on a key to update accessMask
47ddd2b		Update README.md
```
### 1.0.2
```
dc612d9		Version Bump
a8bcd62		Compile a sane user agent for eveapi xml requests
6eced6a		Change - to _
05378b6		Catch the ConnectionException when checking keys
fa6bcf6		Decrement the counters when checking key types
78441a9		Dont increment past the limit
ff3df0a		Add ability to check if the EVE XMLAPI is down.
3ec7598		Add primary key
f954257		Add primary key.
```
### 1.0.3
```
53c168f		Add check to job_ids and version bump
```
### 1.0.4
```
7be3801		Version Bump
6302a17		Handle some HTTP response codes for expired keys
```
### 1.0.5
```
03101f9		Version Bump
5562f03		Add corporation bookmarks updater
17c7c41		Resolve the closest celestials for bookmarks
c7bef60		Only resolve to items that have names
856f66f		Add channel relations
```
### 1.0.6
```
74dcedb		Version Bump
fb2e473		Set composer versions using ~
f9fdfb5		Merge pull request #4 from warlof/shareholders
fd53795		Keep track of the closest distance.
9840802		Provide a fix to eveseat/seat issue #21
69e8c3b		Merge pull request #3 from warlof/contactslabels
173f57c		Provide a fix to eveseat/seat issue #5
```
### 1.0.7
```
f816c1d		Version Bump
dd72510		Default to an Unknown system
1e41a94		Default to the solarsystemid instead of null
da049c7		Fix eveseat/seat#8 by checking if the body exists before insert
ff48a73		Add the CustomsOfficeLocations API updater
601eb36		Specify phealng version with a ~
a08e970		Remove specific minor version.
a93f674		Bump minimum PHP version
```
### 1.0.8
```
eac8500		Version Bump
83cb845		Fix eveseat/seat#37
```
### 1.0.9
```
ab271fa		Version Bump
c285f7d		Update copyright
e741457		Code style fixes
```
### 1.0.10
```
3a5c6cf		Version Bump
6995d17		Fix eveseat/seat#52 by searching by refTypeID to update
```
### 1.0.11
```
ab985bd		Version Bump
d4d4f50		Dont disable on HTTP 403. Too many false positives.
```
### 1.0.12
```
56c8444		Version Bump
00d8697		Catch the PhealException to handle XML parsing issues
ab00f40		Temporarily fix eveseat/seat#71 by catching the PhealException
20f00e9		Mark jobs as done in the case of errors.
```
### 1.0.13
```
8f8e0b1		Version Bump
e9db18e		Add a block if an admin contact email has not been set.
459d353		Add the new char/Clones and char/Skills endpoints as updaters
ccc7a08		Fix XSD as 2 new endpoints have been added, bumping accessMask to long type
85b21b0		Disable keys that respond with HTTP 403 in APIKeyInfo
```
### 1.0.14
```
c812028		Version Bump
55f1ade		Fix eveseat/seat#100 by finding by primary key only.
4451000		Fix eveseat/seat#99 by cleaning up after a key is deleted
```
### 1.0.15
```
c02f338		Version Bump
3356cd0		Fix method comment
bd3e928		Handle the `failed()` method on jobs by updating the `JobTracking`.
```
### 1.0.16
```
804bbdc		Version Bump
cfdf20c		Report Exception types that have occured.
69de2a2		Add timestamp to error.
87efa4b		Add model for the failed_jobs table
```
### 1.0.17
```
d9af10e		Version Bump
1267346		Remove DispatchesJobs trait and use Bus Facade
```
### 1.0.18
```
27bc174		Version Bump
ca27d33		Fix imports, comments and codestyle
df05261		CharacterInfo API access mask compatability and legacy deprecation (#6)
4123994		Add missing comment
d33d2cf		Merge pull request #5 from warlof/paid-until
ddf666f		adding api_key_status into apiKey relation
```
### 2.0.0
```
06810af		Version Bump! 2.0.0! ⚡️
0227052		Update fields to bigInt in light of the recent CCP announcement.
6d62a2d		Fix typos and remove ambogous __CLASS__ reference
3123010		Lazily utf8 encode mail bodies
8496356		Add doctrine/dbal as needed by some migrations.
f4ad084		First iteration of adding worker constraints.
92e2d5d		Improve generic error logging to be aware of the fact that no longer have context of the job_tracker.
cd7b4f8		Drop minimum stability, add prefer-stable and bump to 2.0.0-alpha2.
53a181a		Update composer for 2.0 packages and version 2.0.0-alpha1
edb45bd		Add a relationship between message headers and bodies.
9983367		Allow for notification on the character sheet
271aa73		Fix type hint to an int instead of string
59a83e5		Move the `Affiliation` updater to a character specific class.
12b0999		Add CharacterAffiliation updater. This is prep for the intel module.
b68cd19		Code formatting fixes
79e30bd		Use logger() helper
34ac286		Extract some error handling up to the base abstract class
77172ec		Cleanup methods, add type hints and remove unused code
f4af243		Make the integer migration a little more understandable.
66c6bba		Add more contact related fields to the integer fixes
c083f61		Start refactoring the job tracking and error handling from a Trait to Class
61af28c		Add migration to fix text sizes
946ee47		Fix labelMask integer sizes.
8699992		fix migration by disabling sql modes (#7)
bcd15e0		Fix for RefTypesModel->refTypeName not updating properly. (#8)
dffd1c9		Pass the the exception thrown into the `failed()` method.
e07f36b		Fix schemas to work with MySQL in strict mode.
58da2c8		Require PHP7 and Laravel 5.3
8071dce		Set the primary key type
91e4b2a		Fix Jobs and dispatcher to accommodate L5.3 changes
e908f11		Rename `lists()` to `pluck()`
```
### 2.0.0-alpha1
```

```
### 2.0.0-alpha2
```

```
### 2.0.1
```
59f7f5f		Version Bump
199741d		Fix eveseat/seat#153 by casting the string to an int.
0ea98a4		Update Travis to only allow PHP 7 now.
06810af		Version Bump! 2.0.0! ⚡️
0227052		Update fields to bigInt in light of the recent CCP announcement.
6d62a2d		Fix typos and remove ambogous __CLASS__ reference
3123010		Lazily utf8 encode mail bodies
8496356		Add doctrine/dbal as needed by some migrations.
f4ad084		First iteration of adding worker constraints.
92e2d5d		Improve generic error logging to be aware of the fact that no longer have context of the job_tracker.
cd7b4f8		Drop minimum stability, add prefer-stable and bump to 2.0.0-alpha2.
```
### 2.0.2
```
c11c64a		Version bump
c62c2ed		Increase the reason field length for corp_member_medals.
```
### 2.0.3
```
b6000b7		Version Bump
ec9368b		Fix eveseat/seat#155 by increasing column size.
```
### 2.0.4
```
40d5a34		Version Bump
737f28c		Experimental performance patch by making the PhealFetcher a singleton.
f00190d		Remove the Pheal Rate limit setting and use the defaults.
```
### 2.0.5
```
d1658a3		Version Bump
4072f01		Update travis yaml with root package version
70b4f66		Remove useless log entry
60af828		Formatting & typo fixes.
8f3ce57		Allow for the joblog to be disabled via a config setting.
1c8516f		Fix typo
826f3cf		Add update worker job logging
```
### 2.0.6
```
fe3fd7a		Version Bump
0f6cb57		Log constraints to the joblog
```
### 2.0.7
```
7ba4970		Version Bump
d370866		Use the same queue priority as the parent job.
260b854		Update reason for disabling key.
e05a24a		Add a grace error count before disabling API keys
296e24f		Dont update Courier ContractsItems
2fae54f		Add link to docs for more information.
```
### 2.0.8
```
aa25f97		Version Bump
3cad74d		Fix eveseat/seat#159 by checking if the titles isset first.
```
### 2.0.9
```
73a778f		Version Bump
f7b9b8e		Character Assets are now pulled recursively (#12)
91508da		Style fix
fb68a10		Improve queue job handling.
6d945c0		Remove queue tries check.
54b8297		Update styleci config
7d513eb		Apply fixes from StyleCI (#10)
4577068		Add StyleCI configuration & badge
f1a93d2		avoid primary key duplication if more than a worker is working on the same characterID (#9)
93b2124		Style fixes
```
### 2.0.10
```
57cefe6		Version bump
f7d0f14		Dont enable job logging by default
7b80128		Add codeclimate configuration
```
### 2.0.11
```
dc0473a		Version Bump
f68007a		avoid duplicate entry on character notification update (#17)
c80e611		fix an issue which allow an empty response to be processed (#16)
```
### 2.0.12
```
017729d		Version Bump
24e19c1		Remvove characterID & corporationID checks.
```
### 2.0.13
```
e763e48		Version Bump
8d0eced		Style fixes.
9e36c80		add industry jobs history to industry job and fix CCP shit on job status (#21)
465e6cf		optimise dashboard query for top mail badge by adding an index on sentDate (#20)
```
### 2.0.14
```
8a00bfa		Version Bump.
e5729f6		Small formatting fixes and add missing function comment.
025f51a		provide hotfix for people & group when a key is deleted (#22)
```
### 3.0.0
```
5ec1877		v3.0.0 🎉
c5d7c66		v3.0.0-beta23
03beeda		fix job tag (#105)
9aaf46a		Apply fixes from StyleCI (#104)
4dcfa88		Perform soft deletes on RefreshTokens.
ecc127f		drop outdated skills from queue (#103)
10ce346		v3.0.0-beta22
8dd1e83		Rename insertOnDuplicateKey to upsert().
00f3a80		Convert contracts items updater to upsert.
f440473		Fix corporation contract items job throttling.
92c4955		denying all pull attempt from Corp job with NPC corp (#102)
cbaac66		v3.0.0-beta21
1065f7c		Update relationships.
24ff52a		v3.0.0-beta20
ecfa73a		Update CustomsOfficeLocations.php (#101)
171748c		Fix https://github.com/eveseat/seat/issues/346 (#100)
315a8d4		v3.0.0-beta19
f0420d2		Cater for cases where a status is not yet know.
9857681		v3.0.0-beta18
c736336		Remove extra newline.
9c1b7e9		Add relationships for model cleanups.
c3b56f2		Include an exception threshold.
a6188d0		Add missing preflight checks.
d2341ec		Cache ESI status.
1d45f32		Apply fixes from StyleCI (#99)
99e656d		Add missing newline.
833c8bb		Refactor authenticated check to a generic preflight check.
d4577c1		fix affiliation job (#98)
f348855		ensure we really stop pulling NPC corp information (#97)
6f5a01e		v3.0.0-beta17
51e90e5		fix job dispatcher for alliance (#96)
856919f		v3.0.0-beta16
0039be4		Add relationships.
1f7c3d8		Fix style.
cbed5c8		Limit the total runtime for the contract items updater.
978614e		Improve query and rate limit character assets universe name lookups.
75eb798		v3.0.0-beta15
cde417d		Fix mail_label index migration.
b924507		v3.0.0-beta14
d7d5050		fix mail_labels primary key and indexes in order to avoid deadlock (#95)
16147ee		v3.0.0-beta13
62fe633		Limit the universe structures endpoint until :ccp: fixes it.
dade426		Update docblocks and formatting.
6df3fff		reduce alliance info job time by dispatching dedicated job for each alliance (#94)
0856a73		Formatting fixes.
f467c08		The Ship Update Job will now fetch the characters ship type id  (#93)
436e017		Exclude empty contract from contract item job (#92)
ee2afeb		v3.0.0-beta12
26a5b14		Ensure type is set before attempting to access its name.
3546247		v3.0.0-beta11
0564cbc		Fix Mining ObserverDetails job (#91)
24966ec		Fix firstOrCreate and firstOrNew in order to avoid integrity issue (#90)
f602faa		v3.0.0-beta10
4372f54		Fix npc corp range (#89)
533b7da		v3.0.0-beta9
3999135		More bulk inserted jobs (#88)
20bd291		Fix nullpartyid nameresolver (#87)
a925f99		Fix corpindyminingobserverdata (#86)
017baff		Add missing cachecheck (#85)
07d9491		v3.0.0-beta8
91baaa8		Style fixes.
df1ac86		Skip npc jobs (#84)
c72beed		v3.0.0-beta7
087781a		Report deprecations and endpoint warnings.
74e4861		Restore exception analytics.
dba09c4		Include 'Director' as a valid role.
67aaabf		Restore cache check.
5b5518f		Finally, add character bookmarks updater.
447c9c8		Only persist the structure if it does not exist.
a2269b4		v3.0.0-beta6
a3120c1		Only specify the log directory.
3e53350		v3.0.0-beta5
3694171		Remove extra space.
bfa6e99		Add configuration options for Eseye log levels.
d8d7b2b		Longrunning jobs (#81)
69913d5		Fix mining jobs detail endpoint (#80)
47978c4		Apply fixes from StyleCI (#79)
29b3f70		v3.0.0-beta4
deca315		fix job time using bulk insert (#78)
82deca1		Comments and formatting updates.
e1febf0		skip NPC corporation from jobs (#77)
3bc116e		Add mail relationships (#76)
aceb24f		fix user relationship (#75)
b0f60fd		Add relationships.
5aad9e0		v3.0.0-beta3
1cf129a		Add relationships.
efd6474		Add more relationships.
a29980a		Rename trait and formatting fixes.
97117b2		Prices bulkinsert (#74)
b324a16		v3.0.0-beta2
228e6ce		Upgrade packages and version 3.0.0-beta1
857e258		Remove unit testing for now.
81ac516		Apply fixes from StyleCI (#73)
17131ea		Indentation and sorting fixes.
0fd71c6		Fix various typos and annotator warnings.
fac24cf		Formatting and style fixes.
8aa74a1		integrate eveseat-mining-ledger in core (#70)
144d9c5		Handle invalid refresh_tokens.
46739d1		Fix deprecated endpoints (#72)
1e9524c		prune chat channels (#71)
b8864e6		prepare job for missing corporation contact labels according to ccp-zoetrope feedback ccpgames/esi-issues#779 (#68)
40bd8df		Add corporation_roles() relationship.
ccd54c5		Extrax maximum cycle requests to a property.
19ad66f		Refactor the corporation contract items throttler.
7a9b0c8		Backoff workers if cached responses were loaded.
0cdc564		Minor style and format changes.
696b982		Esi intel (#67)
4a983e0		Begin testing early cached backoffs for updaters.
13623b3		Apply fixes from StyleCI (#66)
8f0b6a4		persist unknown structure only if we don't already have it (#64)
e284415		Fix roles scopes (#63)
a2e98b2		Set Eseye logfie & cache path via config.
5b43af0		Restore scopes needed for PI data.
2212dd5		Relate refresh tokens with users.
00820e1		Corporation 3.x Update Endpoints (#62)
111bc68		Disable writable scopes.
d78584b		Improve doc related to categoryID filter on name and location jobs (#61)
c9f564d		Fix some typos.
1a5c263		Minor formatting changes.
bca7f71		Corporation 3.x (#60)
3fcf174		fix corporation sheet with ESI upgrade (#58)
51531e2		Minor refactorings.
43e5d19		Add model relations, Universe related jobs and other bugfixes.
5101748		Minor refactorings and introduction of IsReadOnly trait.
5491401		add few model relation related to character sheet view (#44)
379fe57		Minor class definition bugfixes.
dfb069c		Fix SSO scope checking that require in game roles too.
582f2f4		Remove hardcoded character_id.
fadef7b		Add authentication check to jobs.
c047f8c		Add more job scope requirements and tags fixes.
2f24143		Add updaters scope definitions and other small fixes.
aaff317		Remove unnecessary else.
f9f1b21		Use configuration file for endpoint role requirement lookups.
2921a14		Add scopes and roles checker for jobs.
2b09221		Update Extraction updater to Station_Manager role.
3a3a82a		Add a corporation job < - > ingame role mapping.
a1294bb		Replaced duplicate column with index creation. (#42)
abe7d90		Add corporation members titles updater.
969c723		RIP XML API. 💀
0775169		Add missing docblock.
4f96333		Esi calendar attendees (#41)
4a8c2c7		Add foreign key constraint to alliance members and other fixes.
7d4c70a		implement alliance endpoints (#40)
3be73f6		Add job tags and fix tags method so we can make public call (#37)
f0a64f3		Add missing docblocks and style fixes.
ba7c4a3		add job for calendar attendee endpoint (#39)
42fa5fe		Formatting and namespace updates.
55ddfa5		Observer detail (#36)
a4f3be5		Add corporation market orders updater.
b6047cf		Add corporation killmails updater.
ce3fa16		Add corporation mining observer udpater.
91f27fd		Add corporation mining extractions updater.
5914ac1		Add corporatino industry jobs updater.
9cb5f7f		Fix table pluralisation and various other docblocks/syntax.
d35caf1		Update license to GPL-2.0-or-later so packagist can update.
b2f7ea9		add corporation member limit and wallet endpoints (#33)
ad75ff7		Fix eveseat/eveapi#232 (#34)
3bef78c		Add character affiliations updater.
e75ac70		Minor refactors and docblock updates.
3c86581		Add more corporation endpoints (#32)
6fcfb9f		Code formatting and docblock fixes.
ef8a4ac		Improve corporation endpoint parity (#31)
be59da9		Add missing docblocks and getCharacterId -> getCorporationId fixes.
5d3ef6c		Provide support for some more root level corporation endpoints (#30)
d513281		Add character contract items & bids updater and fix character udpaters.
02c53af		Add corporation contacts updater.
ef9e48c		Add corporation bookmarks folder updater.
9857722		Add paginator and cleanups to the corporation bookmarks updater.
a3839ff		Remove debugging code.
5b34fa7		Remove debug code.
5a38c1f		end medals implementation (#29)
7f30130		Minor docblock updates.
2220ba5		Complete Character PI updater (#28)
c4cbcc4		Add corporation bookmarks updater.
d303570		Do not pick celestials with a 0.0 position
18df457		[WIP] Add corporation asset location and name endpoints.
1ba7ed1		Add corporations assets updater.
bbaf673		Update workers to be more Horizon friendly.
e0b76f1		Remove unused, XML API related classes.
5a859b3		Add character wallet transactions updater.
719cddf		Add character wallet balance and journal updaters.
e5bbbe5		Move character skills updater to different namespace.
d5731a8		Add character skill queue updater.
5cb6bf8		Add character attributes updater.
1c3673c		Add server status updater.
f99b1dd		Add character PI planets updater.
306aad0		Add character market order updater.
7b6b0c4		Add character shup updater files. 🤖
040c733		Add character ship updater.
2aa07e1		Add character online updater.
07fa346		Remove debuggin code.
5062a21		Add character location updater.
74f0f0b		[WIP] Add character killmails victim and attacker updaters.
3e3f3ff		[WIP] Add characters killmail updater.
7e26a10		Add character mining ledger updater.
55f68b0		Formatting fixes and a minor optimization for agent research updater.
ee83088		Character skills and update character_id table column type (#27)
cdd0832		Add indexes on industry jobs table.
69cfa89		Add character industry jobs updater.
bef12c6		fix fitting relation issue and add a primary key on fitting_item table (#26)
6dc3e3d		Add character fittings updater.
5264648		Add character contracts items updater.
96178b1		Add character contract bids updater.
ade06bd		Add character contracts updater.
e3d922c		Add character contact labels updater.
738c814		Add character contacts updater.
1de19da		Add character implants updater.
5cc40a5		Add character jump clone updater.
2c29a5e		Add character calendar event detail updater.
0164725		Add character calender events updater.
82a606b		Add check if a paged response was expected but not given.
cc38477		Add character bookmark folders updater.
8d12a2a		[WIP] Add character bookmarks updater.
e280456		Add character assets, locations and names updaters.
d3cf187		Allow for jobs to set a request body.
c97d15e		Add character mailing lists updater.
996232e		Add character mail labels updater.
0213a1a		Add character mail updaters.
f09a775		Add character titles updater.
33caeeb		Add character stats updater.
0a756e8		Fix exception throwing for the Warning header.
6c0698c		Throw exceptions if responses contain the Warning header.
1381136		Add character standings updater.
d371385		Add character roles updater.
f89fd32		Remove older XML API helpers.
662321e		Add character notifications updater.
9aa65d6		Add character medals updater.
c70349d		Add character jump fatigue updater.
d7ca222		Add character corporation history updater.
e1226d1		Throw exception if an unexpected paged response is received.
64fc698		Add Character Chat Channel updater.
8ecd74a		Fix typo.
4593ec8		Remove old SeAT 2.x models and database migrations.
c1df71b		Fix code style and add indexes.
bfaa272		Add blueprints updater with paging support.
3a5dc5f		Add first ESI Character Info updater.
af24fa0		Fix property scopes.
1decf9a		Update job class structures to use properties
9756307		[WIP] First pass at adding ESI as a data source.
640427a		[WIP] Add support for refresh token storage.
0ce7233		fix duplicate entry erro while inserting jump clones (#23)
```
### 3.0.0-beta1
```

```
### 3.0.0-beta2
```
b324a16		v3.0.0-beta2
```
### 3.0.0-beta3
```
5aad9e0		v3.0.0-beta3
1cf129a		Add relationships.
efd6474		Add more relationships.
a29980a		Rename trait and formatting fixes.
97117b2		Prices bulkinsert (#74)
```
### 3.0.0-beta4
```
29b3f70		v3.0.0-beta4
deca315		fix job time using bulk insert (#78)
82deca1		Comments and formatting updates.
e1febf0		skip NPC corporation from jobs (#77)
3bc116e		Add mail relationships (#76)
aceb24f		fix user relationship (#75)
b0f60fd		Add relationships.
```
### 3.0.0-beta5
```
3e53350		v3.0.0-beta5
3694171		Remove extra space.
bfa6e99		Add configuration options for Eseye log levels.
d8d7b2b		Longrunning jobs (#81)
69913d5		Fix mining jobs detail endpoint (#80)
47978c4		Apply fixes from StyleCI (#79)
```
### 3.0.0-beta6
```
a2269b4		v3.0.0-beta6
a3120c1		Only specify the log directory.
```
### 3.0.0-beta7
```
c72beed		v3.0.0-beta7
087781a		Report deprecations and endpoint warnings.
74e4861		Restore exception analytics.
dba09c4		Include 'Director' as a valid role.
67aaabf		Restore cache check.
5b5518f		Finally, add character bookmarks updater.
447c9c8		Only persist the structure if it does not exist.
```
### 3.0.0-beta8
```
07d9491		v3.0.0-beta8
91baaa8		Style fixes.
df1ac86		Skip npc jobs (#84)
```
### 3.0.0-beta9
```
533b7da		v3.0.0-beta9
3999135		More bulk inserted jobs (#88)
20bd291		Fix nullpartyid nameresolver (#87)
a925f99		Fix corpindyminingobserverdata (#86)
017baff		Add missing cachecheck (#85)
```
### 3.0.0-beta10
```
f602faa		v3.0.0-beta10
4372f54		Fix npc corp range (#89)
```
### 3.0.0-beta11
```
3546247		v3.0.0-beta11
0564cbc		Fix Mining ObserverDetails job (#91)
24966ec		Fix firstOrCreate and firstOrNew in order to avoid integrity issue (#90)
```
### 3.0.0-beta12
```
ee2afeb		v3.0.0-beta12
26a5b14		Ensure type is set before attempting to access its name.
```
### 3.0.0-beta13
```
16147ee		v3.0.0-beta13
62fe633		Limit the universe structures endpoint until :ccp: fixes it.
dade426		Update docblocks and formatting.
6df3fff		reduce alliance info job time by dispatching dedicated job for each alliance (#94)
0856a73		Formatting fixes.
f467c08		The Ship Update Job will now fetch the characters ship type id  (#93)
436e017		Exclude empty contract from contract item job (#92)
```
### 3.0.0-beta14
```
b924507		v3.0.0-beta14
d7d5050		fix mail_labels primary key and indexes in order to avoid deadlock (#95)
```
### 3.0.0-beta15
```
75eb798		v3.0.0-beta15
cde417d		Fix mail_label index migration.
```
### 3.0.0-beta16
```
856919f		v3.0.0-beta16
0039be4		Add relationships.
1f7c3d8		Fix style.
cbed5c8		Limit the total runtime for the contract items updater.
978614e		Improve query and rate limit character assets universe name lookups.
```
### 3.0.0-beta17
```
6f5a01e		v3.0.0-beta17
51e90e5		fix job dispatcher for alliance (#96)
```
### 3.0.0-beta18
```
9857681		v3.0.0-beta18
c736336		Remove extra newline.
9c1b7e9		Add relationships for model cleanups.
c3b56f2		Include an exception threshold.
a6188d0		Add missing preflight checks.
d2341ec		Cache ESI status.
1d45f32		Apply fixes from StyleCI (#99)
99e656d		Add missing newline.
833c8bb		Refactor authenticated check to a generic preflight check.
d4577c1		fix affiliation job (#98)
f348855		ensure we really stop pulling NPC corp information (#97)
```
### 3.0.0-beta19
```
315a8d4		v3.0.0-beta19
f0420d2		Cater for cases where a status is not yet know.
```
### 3.0.0-beta20
```
24ff52a		v3.0.0-beta20
ecfa73a		Update CustomsOfficeLocations.php (#101)
171748c		Fix https://github.com/eveseat/seat/issues/346 (#100)
```
### 3.0.0-beta21
```
cbaac66		v3.0.0-beta21
1065f7c		Update relationships.
```
### 3.0.0-beta22
```
10ce346		v3.0.0-beta22
8dd1e83		Rename insertOnDuplicateKey to upsert().
00f3a80		Convert contracts items updater to upsert.
f440473		Fix corporation contract items job throttling.
92c4955		denying all pull attempt from Corp job with NPC corp (#102)
```
### 3.0.0-beta23
```
c5d7c66		v3.0.0-beta23
03beeda		fix job tag (#105)
9aaf46a		Apply fixes from StyleCI (#104)
4dcfa88		Perform soft deletes on RefreshTokens.
ecc127f		drop outdated skills from queue (#103)
```
### 3.0.1
```
74cf25d		v3.0.1
ed929f6		Rename references to garbage collection and fix array access.
12c20ed		add garbage collector on PI job (#106)
5ec1877		v3.0.0 🎉
```
### 3.0.2
```
b3b50c4		v3.0.2
185dbef		Remove depracted outposts updater.
```
### 3.0.3
```
7b84940		v3.0.3
99c0e60		add skill cleaner as CCP may remove some skills from the game (#109)
ace3516		Improve api docs (#108)
2cb5dd6		Enabler: Include Main Character to MemberTracking (#107)
```
### 3.0.4
```
d20bd70		v3.0.4
ea81668		Fix typo.
a642e4e		feat(character): Add the relation to character_info_skills (#115)
79fdf35		fix(corporation tracking): fix last location column (#114)
1779898		fix(jump clones): Display name of player structure (#113)
bea007b		feat(contacts): Bump both character and corporation contacts endpoint to v2 (#112)
47eb7b9		fix(mail): Add missing cast definition on MailHeader (#111)
e14b4c2		Formatting fixes.
5cee7c3		Fix structure resolving (#110)
```
### 3.0.5
```
ff5b558		v3.0.5
3b68764		feat(mining): use ore materials to compute amount instead itself (#119)
91a526d		fix(structure resolver): Improve queries returning structure_id (#117)
```
### 3.0.6
```
16a0f1a		v3.0.6
a4dc6e0		Merge pull request #120 from warlof/structuretoarray
9566b80		fix(structure): Fix ternary init to return array instead object
```
### 3.0.7
```
99e8e22		v3.0.7
05069c9		feat(prices): Lock mining values
```
### 3.0.8
```
29c88ef		v3.0.8
44a4193		Outdated endpoints (#131)
```
### 3.0.9
```
5c1af39		build(core): v3.0.9
c049949		fix(corporation): Update corporation killmails according to partials update
4a9b595		fix(corporation): Update corporation journal according to partials update
b2bbe72		[feat](mails): Add sender to relation eager load
15c96a5		[feat](wallet): Add client to eager load relationship
2d46cc3		[feat](killmails): Use ORM relationship in order to avoid raw JOIN
fabbf44		[feat](core): Use new migration mechanic
d964f4c		Merge branch '3.0.x'
68698b3		fix(sde): Remove typeID special attribute as it is already defined (#126)
ab76b81		fix(jobs): Fix required role for extraction job (#125)
7fbd8b7		fix(token management): Revoke access_token when it does not match with client app. (#124)
5e24eb7		fix(mining ledger): Fix loading time issue due to prices eager-load (#123)
```
