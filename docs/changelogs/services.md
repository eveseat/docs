![SeAT](http://i.imgur.com/aPPOxSK.png)

# services change logs
Generated with: `git log --pretty=format:%h%x09%x09%s`

### 1.0-pre-alpha
```
93958d6		Update README
666036a		Add method to get corp wallet transactions
bcb36f7		Fix filter rule reference
5e579ec		Add methods to get standings and wallet journal
91163b3		Fix a join
bab5d59		Add method to get corp market orders
6b2734d		Add method to get corp killmails
513c1e5		Add method to get corp industry jobs
eb0b9d7		Add method to get corp contracts
3b2e7eb		Add methods to get corp contacts & labels
057e1d4		Add method to get corp assets
907870a		Add methods for corp summary pages
c4a4977		Small refactor to remove attributes instead of making them blank
0b1ee7a		Add method to cleanup CCP produced HTML
11e55c6		Add method to list corporations
3a76e64		Fix typo
02eea36		Add ability to just dump query and continue load
c71ca03		Add method to get character standings
be1c6db		Add method to get character research info
7d0105c		Add method to get character pi
6ea00fb		Add methods to get character market orders
18e3580		Add method comments
4daabd8		Add method to get character industry
196e968		Add method to get contract information
3ad8de1		Add method to get killmails
2c5ca99		Lock type image to max 32/64px
0071fa7		Add character contact lists and calendar repositories
11ebe15		Add character notifications repo
52807cf		Add the Notification Types Seeder
6560b34		Add rules to ensure columns can not be tampered with
bb32b1b		Add Character Assets services
cc493be		Style fixes
0e56275		Add Mail Service for Characters
6fa7631		Add Character Wallet Transactions Service
bd1b364		Add Wallet Journal Services
22d7e6f		Add option to auto-detect image types
f899060		Rename method from Character->Eve
d3f6fb7		Add more methods for character information
46910d1		Fix a table ambiguity problem for characterID
33463b9		Add more repository methods
f75cd7c		Add Services for Character Skills
d35099a		Add security repository
9bcb126		Add more methods for character info
71e3864		Add a number formatter
55a29d2		Add repositories to get character information
04df3b9		Add a query builder filterable helper
0fdea02		Add SQL debug helper
6e32c77		Add Respository to support the Queue
54cda05		Set extention correctly based on image type
4172206		Add a service to prepare lazy loaded <img> tags
89dfbb2		Add user modifiction services
30bdace		Add repositories used in eveseat/web acl
a8ff125		Update to match eveseat/eveapi Model refactor
4a69ce0		Add Config file
ea84fb0		Add Queue Data Source
2f60e1d		Add EveApiKeyData service
467fb42		Update badges
5779eff		Prepare repository for packagist
a46f437		Initial commit
```
### 1.0.0
```
300cdde		Update required eveseat package version
526493c		Style Fixes and Version Bump
9ded93d		Add registration options
e5348f0		Update to support new settings features
f601b60		Move options scope to public
dcbd238		Add a setting() helper and provide some defaults
82115c2		Add a settings service
c72cd8a		Add methods to query corp security info
5371848		Add method to get corp member tracking
```
### 1.0.1
```
f32b199		Version Bump
9a2fe0f		Allow to get/set settings for another user by id
71504e9		Add default for email notifications
8109b5c		Add service for database stored schedules
d4afc21		Ensure we pass integers to the helper
```
### 1.0.2
```
717f9fb		Add server status method
f2172dc		Update README.md
8b65137		Add default MFA setting
```
### 1.0.3
```
e1c75bb		Version Bump
```
### 1.0.4
```
d087604		Version Bump
d3d6bd0		Add an admin contact setting
a5b4135		Order jobs by date
```
### 1.0.5
```
af4abdc		Version Bump
cda2f34		Default to english language
ea02832		Add method to get mail timeline
28b0933		Suppress errors incase the html is invalid
012e0e6		Add method to get an email for a character
```
### 1.0.6
```
aa17e7d		Version Bump
691dc5c		Prevent dupe or corp chars from showing
1b93322		Prevent duplicate entries in corp member tracking
```
### 1.0.7
```
5734db7		Version Bump
e221f72		Add method to get corp bookmarks
30699d3		Add method to get character bookmarks
afd7cba		Add method to get character chat channels
6ca677b		Second attempt at fixing eveseat/seat#7
```
### 1.0.8
```
ebd21c7		Version Bump
e7a055d		Set composer versions using ~
08a50d8		Determine capacity bonus with tower
aa51300		Temporarily ignore nested groups
5ff8e0a		Add methods to get starbase related data
63e9be9		Return paginated results
```
### 1.0.9
```
cd3878c		Version Bump
a0c30a9		Version Set via ^
```
### 1.0.10
```
e985e13		Version Bump
9e75900		Revert version setting via ~
```
### 1.0.11
```
bb1cd45		Version Bump
0d139b2		Allow starbase details to be loaded by starbase_id
```
### 1.0.12
```
c3d9aaf		Version Bump
bee194f		Add method to get corporation customs offices
```
### 1.0.13
```
e33ed92		Version Bump
582d719		Fix eveseat/seat#28
```
### 1.0.14
```
e4d521b		Version Bump
96c9fb5		Update copyright
c9cd51c		Ensure that people.view role is enforced
2f1e9e3		Add methods for People groups
f7bb649		Handle some unicode characters for cases like eveseat/seat#13
0ad1ffa		Code style fix
```
### 1.0.15
```
570bbd0		Version Bump
630b8af		Remove unused pagination and CS fixes
cbc4206		Services for Corporation Ledger queries. (#5)
b87d364		Order jobs by creation date
```
### 1.0.16
```
439fbac		Version Bump
ea240c7		Add defaults for minimum access mask checking settings
d7b7eaf		Add the search service
ce085f7		Fix eveseat/seat#93 by filtering corporation_account_balances too
0c03b8e		Modify timeline method to retrive one specific message
```
### 1.0.17
```
e35f552		Version Bump
10c4a86		Set default values for 'allow_sso'
```
### 1.0.18
```
b3d538d		Version Bump
305a3ab		Sort killmails by newest first.
2edf0fd		Add module info if a single starbases' info is called
```
### 1.0.19
```
b2b9995		Version Bump
744e982		Paginate Killmails
5711563		Paginate contracts. Part of the fix for eveseat/seat#111
```
### 1.0.20
```
cfcefda		Version Bump
7fa3040		Add missing import of CharacterSheetCorporationTitles
b4a8080		Set available options and defaults for usage tracking
b2765c6		Add analytics Jobs using Google Analytics measurement protocol.
9d23cb6		* Add corporation titles to character sheet (#7)
26c1673		Fix eveseat/seat#112 by using an advanced where to group the filter
58cfc96		Add the `seat:queue:clear-expired` scheduled command
```
### 1.0.21
```
0ad3ccf		Version Bump
```
### 1.0.22
```
a0a0c75		Version Bump
02ad71e		Seed the expired job time to run every 6 hours
```
### 1.0.23
```
49bc082		Version Bump
a199fa9		Add getCharacterAlliances method
dfaa83a		Add char and corp minimum mask defaults
4739b90		Add a default for the `installed_sde` setting
```
### 2.0.0
```
b3fdb7a		Version Bump! 2.0.0! ⚡️
cdde3d0		Format and style fixes.
95eee16		Allow longer values in the global settings.
b64e55b		Add default for api_constraint
77822f5		Formatting and style fixes.
ae73811		Add methods for searching.
dcc872f		Return a unresolved query.
ac10ed1		Rename getAllCharactersWithAffiliations method.
0277069		Move character skills graph info from the Stats to Character repo.
7a2ca83		add skills related chart (#10)
5f2f09f		Fix where clause for PI (#11)
69ad918		Drop minimum stability, add prefer-stable and bump to 2.0.0-alpha2.
95f0453		Update composer for 2.0 packages and version 2.0.0-alpha1
3367168		Add more data sources for the dashboard.
0da12f3		Allow specifying which tags to exclude when cleaning html.
e87cb20		Fix member tracking counts by using a leftJoin.
f70db5f		Dont override existing schedules when seeding the database.
2cbaf0f		Allow carbon helper to be called without an argument.
41a9b07		Add `updateNote` method.
a1c72d6		Add Trait that allows adding notes to any model.
dc81167		Return an unresolved query for datatables to work with.
e3437ca		Join invTypes to get the contact type
d804d7e		Return raw query builder objects for use with datatables
3b1cc16		Prevent overriding existing functions.
eca05dd		Alloe setting settings values using the helper.
c62da72		Remove stale usages of the old `Filterable` trait.
68e28c9		Allow for repo queries to return unresolved.
5ae8c91		Add flag to return unresolved queries for datatables.
bdb2ba0		Add Intel repository
f65548e		Code formatting fixes
6ccfb97		Paginate market orders
720e5cb		Use logger() helper
1ad9cfb		Remove `array_flatten()` as collections are returned
d8ddbb0		Fix column ambiguity
d1d46cf		Remove return type as it can be null
d13d650		Refactor Corporation repo to use structured classes
ab9f039		Refactor the Character repository to use seperate classes
3f7a1f9		Return a single value instead of array
6b0aa6c		Remove usage of `collect()`. Collections are returned by default
7784321		Update PHP & Laravel dependencies
1de059b		Log queries based on the value of `DB_DEBUG`
c5ac762		Revert groupBy changes introduced in 982b8661
ee0ff98		Upgrade to coduo/php-humanizer 2.0
869f330		Fix namespace change for humanizer 2.0
982b866		Fix strict mode groupBy constraints
3f1f2c5		Make the query debugger listen on the DB facade directly.
0ff8a45		Fix Job to match L5.3 changes
ac59839		Rename lists() to pluck()
5dc3ac7		Get the value with `value()` instead of `pluck()`
```
### 2.0.0-alpha1
```

```
### 2.0.0-alpha2
```
69ad918		Drop minimum stability, add prefer-stable and bump to 2.0.0-alpha2.
```
### 2.0.1
```
e51c35d		Version Bump
2209e71		Remove return type as it can be null too
eb58671		Fix member tracking query to return correct key statuses.
22f1d42		Add default value for require_activation
b3fdb7a		Version Bump! 2.0.0! ⚡️
cdde3d0		Format and style fixes.
95eee16		Allow longer values in the global settings.
b64e55b		Add default for api_constraint
77822f5		Formatting and style fixes.
ae73811		Add methods for searching.
dcc872f		Return a unresolved query.
ac10ed1		Rename getAllCharactersWithAffiliations method.
0277069		Move character skills graph info from the Stats to Character repo.
7a2ca83		add skills related chart (#10)
5f2f09f		Fix where clause for PI (#11)
```
### 2.0.2
```
de658a8		Version Bump
aaec7d7		Formatting fixes.
0bde264		implement a custom method dedicated to search for ApiKey (#12)
8203f69		Add function to parse evemail threads.
```
### 2.0.3
```
33be7aa		Version Bump
17fcaec		Add new mail_threads option
d966f59		Add method to remove job tracking items
```
### 2.0.4
```
9e68e86		Version Bump
9041297		Dont prefix cache keys with the session_id
```
### 2.0.5
```
fc82256		Version Bump
1a56751		Only prefix user keys with the session_id
```
### 2.0.6
```
318fc64		Version Bump
637e566		Add methods to get contract items
bc09a37		Formatting and code style fixes
84dfae6		Add assetContents collection for Character Assets view (#14)
2efc1ff		including level in skill coverage chart (#13)
```
### 2.0.7
```
462fd5c		Version Bump
0be2e39		Character assets (#16)
44c6db5		Update styleci config
e36d874		Apply fixes from StyleCI (#15)
2ecf750		Add StyleCI configuration & badge
4a232d1		Style fixes
```
### 2.0.8
```
f0074be		Version Bump
9144305		Apply fixes from StyleCI (#17)
f29b680		Add `childContentCount` field for assets
42adef9		Add codeclimate configuration
```
### 2.0.9
```
1095543		Version Bump
dc46c73		Modified cron statements to proper format. Changed from 6 positions to 5 (#18)
```
### 2.0.10
```
3feccc6		Version Bump
eb02e76		avoid null exception on assetlist_locations for starbases trait (#22)
4358497		Added support for the 'Render' type (#23)
```
### 2.0.11
```
4658230		Version Bump
d1bc5b3		Remove an unused variable and style fixes.
654e4da		add ACL filters on dashboard stats (#25)
a65f4a4		Style fixes
f4e1c22		optimise top mail query by dropping join table and exploit getAffiliationMap in order to retrieve the user character IDs (#24)
```
### 2.0.12
```
01a90cc		Version Bump.
294f2cb		Update account status correctly.
```
### 2.0.13
```
86c8bcc		hotfix - add missing ESS amount to the corporation bounty ledger (#38)
```
### 3.0.0
```
33d0d7d		v3.0.0 🎉
f506590		Remove unused class.
1af5a97		Update repository to paginate standings.
4a5e2b6		v3.0.0-beta14
cc5c160		Cleanup empty groups.
2ea8bcb		Add a daily queue restart job to help with some leaks.
b4bd180		fix search issue due to user/group refactoring (#56)
2633f6d		Fix update sde schedule command (#55)
dab8f58		v3.0.0-beta13
494fb0c		Remove extra newline.
db33d22		Add character fittings repository.
bebea11		Drop the default # of workers to spawn.
95df998		v3.0.0-beta12
dc175a1		Add missing .
fb4f0e1		Add maintenance job and schedule.
f25b81b		Add cleanup_data option.
9ba63a3		Add esi status job schedule and repository.
2624b5b		v3.0.0-beta11
911ac7a		Fix settings relationship.
2b7d6b2		v3.0.0-beta10
0aeb7f3		Fix setting set/get affected group id calculation.
9d506e2		fix minor ACL issue related to corporation listing (#54)
4482cf3		v3.0.0-beta9
671844f		Update repository.
d9be804		Style fix.
63dc301		Add structures repository.
7e4a27b		Add `alerts:run` to the schedule.
dcd4b69		v3.0.0-beta8
99a5162		Fix settings cache prefixes to be tied to group ids.
e62d320		Apply fixes from StyleCI (#53)
f0d195d		Show stats for all users in group.
d4bc7a9		Apply settings to a group rather than a specific user.
0d3b09c		v3.0.0-beta7
e9b7c4c		Add the default for number of workers.
a7e3c26		Only show unique emails in the timeline.
7b01ae6		v3.0.0-beta6
7bb0f78		fix route and user/group relationships on user layouts (#51)
701267f		faction are provided by ccp on their cdn on alliance route - except drifter :/ (#50)
280a14a		v3.0.0-beta5
883fedc		Give Analytics job just one try.
bb74a44		Add groups method.
d188fdd		Fix methods after user <-> group association changes.
7c065ad		v3.0.0-beta4
643288d		Rename numberToRomanRepresentation to number_roman and style fixes.
42b9605		Enabler: Extend PI View with Extractors (#49)
c3b4010		Fix return type for getCharacterJournalStandingsWithProfile.
a910847		Remove method return type.
57067dd		v3.0.0-beta3
323a07c		Add missing returns.
9bf27d0		v3.0.0-beta2
128de35		Upgrade packages and version 3.0.0-beta1
d5abfed		Apply fixes from StyleCI (#48)
a24eeb1		Indentation fixes.
ce16ce3		Fix annotator warnings.
0583f55		Formatting and style fixes.
73c92bc		moving queries to service package (#47)
8002684		Fix docstring.
538c27e		Update corporation asset repository.
9ec579d		Use associatedCharacterIds() helper.
47ec800		Include refresh tokens.
a39ce84		pruning chat channel system according to CCP state (#46)
3dcf979		upgrade corporation contact in order to implement labels (#45)
e7fbe1f		update intel for ESI models (#44)
f8b1ea5		Apply fixes from StyleCI (#42)
b44c87f		Add PI as default SSO scope (#41)
c191653		Update code formatting.
31a5376		Issue254 (#40)
2c805ce		Update scheduler with ESI jobs.
282d343		Remove people repository.
60b05cd		Include Horizon metrics jobs.
657ab92		Update Security trait for ESI models.
33b8e39		Update services for mail and corp contacts.
2fce3fb		Remove unused defaults.
0ea54f4		Add sso_scopes global configuration.
6c6de4f		Json encode/decode settings by default.
cfd2ebe		Remove keys eager loading.
e483d9a		Remove nested Trait usage from Corporation repository.
b1092ec		Minor formatting fixes.
adee5b0		Corporation 3.x (#39)
a5df115		Corporation 3.x (#36)
0eb76a2		Fix character list query to allow super admins to see all.
410ea9b		Remove unnecessary return.
17eb41c		Fix query debugger trying to __toString() invalid values.
d7ccf47		Update getAllCharactersWithAffiliations to no longer want keys.
7e253a6		Minor style fixes.
7142106		Update of character service according to new ESI models (#35)
555c6f8		Update methods for profile view.
b51b709		Remove old repositories.
6681ca3		[WIP] Update repositores for ESI migration.
```
### 3.0.0-beta1
```

```
### 3.0.0-beta2
```
9bf27d0		v3.0.0-beta2
```
### 3.0.0-beta3
```
57067dd		v3.0.0-beta3
323a07c		Add missing returns.
```
### 3.0.0-beta4
```
7c065ad		v3.0.0-beta4
643288d		Rename numberToRomanRepresentation to number_roman and style fixes.
42b9605		Enabler: Extend PI View with Extractors (#49)
c3b4010		Fix return type for getCharacterJournalStandingsWithProfile.
a910847		Remove method return type.
```
### 3.0.0-beta5
```
280a14a		v3.0.0-beta5
883fedc		Give Analytics job just one try.
bb74a44		Add groups method.
d188fdd		Fix methods after user <-> group association changes.
```
### 3.0.0-beta6
```
7b01ae6		v3.0.0-beta6
7bb0f78		fix route and user/group relationships on user layouts (#51)
701267f		faction are provided by ccp on their cdn on alliance route - except drifter :/ (#50)
```
### 3.0.0-beta7
```
0d3b09c		v3.0.0-beta7
e9b7c4c		Add the default for number of workers.
a7e3c26		Only show unique emails in the timeline.
```
### 3.0.0-beta8
```
dcd4b69		v3.0.0-beta8
99a5162		Fix settings cache prefixes to be tied to group ids.
e62d320		Apply fixes from StyleCI (#53)
f0d195d		Show stats for all users in group.
d4bc7a9		Apply settings to a group rather than a specific user.
```
### 3.0.0-beta9
```
4482cf3		v3.0.0-beta9
671844f		Update repository.
d9be804		Style fix.
63dc301		Add structures repository.
7e4a27b		Add `alerts:run` to the schedule.
```
### 3.0.0-beta10
```
2b7d6b2		v3.0.0-beta10
0aeb7f3		Fix setting set/get affected group id calculation.
9d506e2		fix minor ACL issue related to corporation listing (#54)
```
### 3.0.0-beta11
```
2624b5b		v3.0.0-beta11
911ac7a		Fix settings relationship.
```
### 3.0.0-beta12
```
95df998		v3.0.0-beta12
dc175a1		Add missing .
fb4f0e1		Add maintenance job and schedule.
f25b81b		Add cleanup_data option.
9ba63a3		Add esi status job schedule and repository.
```
### 3.0.0-beta13
```
dab8f58		v3.0.0-beta13
494fb0c		Remove extra newline.
db33d22		Add character fittings repository.
bebea11		Drop the default # of workers to spawn.
```
### 3.0.0-beta14
```
4a5e2b6		v3.0.0-beta14
cc5c160		Cleanup empty groups.
2ea8bcb		Add a daily queue restart job to help with some leaks.
b4bd180		fix search issue due to user/group refactoring (#56)
2633f6d		Fix update sde schedule command (#55)
```
### 3.0.1
```
2b00724		v3.0.1
d980b88		Remove outposts scope.
ced5016		Add missing comment.
2da79d6		CharacterMiningTotal ISK (#58)
4de3c9a		fix PI extractors query (#57)
33d0d7d		v3.0.0 🎉
f506590		Remove unused class.
1af5a97		Update repository to paginate standings.
```
### 3.0.2
```
aa57926		v3.0.2
4d1fc62		fix(search): Add missing character affiliation filters on mail search (#61)
deb1c96		fix(industry jobs): Fix location field (#60)
fd85db8		fix(corporation assets): Fix asset top level listing (#59)
```
### 3.0.3
```
6155fd9		v3.0.3
6868841		feat(prices): Lock mining values
```
### 3.0.4
```
3335171		build(core): v3.0.4
cad123e		fix(corporation): Update corporation killmails according to partials update
2a71dc3		fix(corporation): Update corporation journal according to partials update
6fef491		[feat](market): Update market tab and refactor partials (#74)
ffba218		[feat](mails): Add sender to relation eager load
4bb2032		[feat](transactions): Move character transactions to async loading
979d245		[feat](core): Use new migration mechanic
6b8417f		[feat](killmails): Use ORM relationship in order to avoid raw JOIN
9f78d66		[feat](wallet): Use ORM relationship to link parties
e913402		[feat](contracts): Move to asynchronous loading
26817c9		[feat](contacts): Move to asynchronous loading
ad8cc1e		[feat](assets): Move to asynchronous loading
22d7612		[feat](users): Move to asynchronous loading
817483c		fix(mining ledger): Fix loading time issue due to prices eager-load (#65)
77b52bb		[fix](prices) Fix historical price table field size
```
