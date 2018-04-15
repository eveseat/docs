![SeAT](https://i.imgur.com/aPPOxSK.png)

# services change logs
Generated with: `git log --pretty=format:"%h%>(12)%ad %<(7)%aN%d %s" --date=short`

### 1.0-pre-alpha
```
93958d6  2015-11-27 Leon Jacobs (tag: 1.0-pre-alpha) Update README
666036a  2015-11-27 Leon Jacobs Add method to get corp wallet transactions
bcb36f7  2015-11-27 Leon Jacobs Fix filter rule reference
5e579ec  2015-11-27 Leon Jacobs Add methods to get standings and wallet journal
91163b3  2015-11-27 Leon Jacobs Fix a join
bab5d59  2015-11-27 Leon Jacobs Add method to get corp market orders
6b2734d  2015-11-27 Leon Jacobs Add method to get corp killmails
513c1e5  2015-11-27 Leon Jacobs Add method to get corp industry jobs
eb0b9d7  2015-11-27 Leon Jacobs Add method to get corp contracts
3b2e7eb  2015-11-27 Leon Jacobs Add methods to get corp contacts & labels
057e1d4  2015-11-27 Leon Jacobs Add method to get corp assets
907870a  2015-11-27 Leon Jacobs Add methods for corp summary pages
c4a4977  2015-11-27 Leon Jacobs Small refactor to remove attributes instead of making them blank
0b1ee7a  2015-11-27 Leon Jacobs Add method to cleanup CCP produced HTML
11e55c6  2015-11-26 Leon Jacobs Add method to list corporations
3a76e64  2015-11-26 Leon Jacobs Fix typo
02eea36  2015-11-26 Leon Jacobs Add ability to just dump query and continue load
c71ca03  2015-11-21 Leon Jacobs Add method to get character standings
be1c6db  2015-11-21 Leon Jacobs Add method to get character research info
7d0105c  2015-11-21 Leon Jacobs Add method to get character pi
6ea00fb  2015-11-21 Leon Jacobs Add methods to get character market orders
18e3580  2015-11-20 Leon Jacobs Add method comments
4daabd8  2015-11-20 Leon Jacobs Add method to get character industry
196e968  2015-11-20 Leon Jacobs Add method to get contract information
3ad8de1  2015-11-20 Leon Jacobs Add method to get killmails
2c5ca99  2015-11-20 Leon Jacobs Lock type image to max 32/64px
0071fa7  2015-11-20 Leon Jacobs Add character contact lists and calendar repositories
11ebe15  2015-10-30 Leon Jacobs Add character notifications repo
52807cf  2015-10-30 Leon Jacobs Add the Notification Types Seeder
6560b34  2015-10-30 Leon Jacobs Add rules to ensure columns can not be tampered with
bb32b1b  2015-10-30 Leon Jacobs Add Character Assets services
cc493be  2015-10-30 Leon Jacobs Style fixes
0e56275  2015-10-30 Leon Jacobs Add Mail Service for Characters
6fa7631  2015-10-29 Leon Jacobs Add Character Wallet Transactions Service
bd1b364  2015-10-29 Leon Jacobs Add Wallet Journal Services
22d7e6f  2015-10-29 Leon Jacobs Add option to auto-detect image types
f899060  2015-10-29 Leon Jacobs Rename method from Character->Eve
d3f6fb7  2015-10-28 Leon Jacobs Add more methods for character information
46910d1  2015-10-28 Leon Jacobs Fix a table ambiguity problem for characterID
33463b9  2015-10-27 Leon Jacobs Add more repository methods
f75cd7c  2015-10-27 Leon Jacobs Add Services for Character Skills
d35099a  2015-10-09 Leon Jacobs Add security repository
9bcb126  2015-10-09 Leon Jacobs Add more methods for character info
71e3864  2015-10-09 Leon Jacobs Add a number formatter
55a29d2  2015-10-08 Leon Jacobs Add repositories to get character information
04df3b9  2015-10-08 Leon Jacobs Add a query builder filterable helper
0fdea02  2015-10-08 Leon Jacobs Add SQL debug helper
6e32c77  2015-10-06 Leon Jacobs Add Respository to support the Queue
54cda05  2015-10-04 Leon Jacobs Set extention correctly based on image type
4172206  2015-10-04 Leon Jacobs Add a service to prepare lazy loaded <img> tags
89dfbb2  2015-10-01 Leon Jacobs Add user modifiction services
30bdace  2015-09-30 Leon Jacobs Add repositories used in eveseat/web acl
a8ff125  2015-09-28 Leon Jacobs Update to match eveseat/eveapi Model refactor
4a69ce0  2015-09-24 Leon Jacobs Add Config file
ea84fb0  2015-09-24 Leon Jacobs Add Queue Data Source
2f60e1d  2015-09-24 Leon Jacobs Add EveApiKeyData service
467fb42  2015-09-24 Leon Jacobs Update badges
5779eff  2015-09-24 Leon Jacobs Prepare repository for packagist
a46f437  2015-09-24 Leon Jacobs Initial commit
```
### 1.0.0
```
300cdde  2015-11-28 Leon Jacobs (tag: 1.0.0) Update required eveseat package version
526493c  2015-11-28 Leon Jacobs Style Fixes and Version Bump
9ded93d  2015-11-28 Leon Jacobs Add registration options
e5348f0  2015-11-28 Leon Jacobs Update to support new settings features
f601b60  2015-11-28 Leon Jacobs Move options scope to public
dcbd238  2015-11-28 Leon Jacobs Add a setting() helper and provide some defaults
82115c2  2015-11-28 Leon Jacobs Add a settings service
c72cd8a  2015-11-27 Leon Jacobs Add methods to query corp security info
5371848  2015-11-27 Leon Jacobs Add method to get corp member tracking
```
### 1.0.1
```
f32b199  2015-12-02 Leon Jacobs (tag: 1.0.1) Version Bump
9a2fe0f  2015-12-02 Leon Jacobs Allow to get/set settings for another user by id
71504e9  2015-12-02 Leon Jacobs Add default for email notifications
8109b5c  2015-12-02 Leon Jacobs Add service for database stored schedules
d4afc21  2015-12-01 Leon Jacobs Ensure we pass integers to the helper
```
### 1.0.2
```
717f9fb  2015-12-04 Leon Jacobs (tag: 1.0.2) Add server status method
f2172dc  2015-12-04 Leon Jacobs Update README.md
8b65137  2015-12-04 Leon Jacobs Add default MFA setting
```
### 1.0.3
```
e1c75bb  2015-12-05 Leon Jacobs (tag: 1.0.3) Version Bump
```
### 1.0.4
```
d087604  2015-12-13 Leon Jacobs (tag: 1.0.4) Version Bump
d3d6bd0  2015-12-13 Leon Jacobs Add an admin contact setting
a5b4135  2015-12-12 Leon Jacobs Order jobs by date
```
### 1.0.5
```
af4abdc  2015-12-16 Leon Jacobs (tag: 1.0.5) Version Bump
cda2f34  2015-12-16 Leon Jacobs Default to english language
ea02832  2015-12-15 Leon Jacobs Add method to get mail timeline
28b0933  2015-12-15 Leon Jacobs Suppress errors incase the html is invalid
012e0e6  2015-12-14 Leon Jacobs Add method to get an email for a character
```
### 1.0.6
```
aa17e7d  2015-12-17 Leon Jacobs (tag: 1.0.6) Version Bump
691dc5c  2015-12-17 Leon Jacobs Prevent dupe or corp chars from showing
1b93322  2015-12-17 Leon Jacobs Prevent duplicate entries in corp member tracking
```
### 1.0.7
```
5734db7  2015-12-20 Leon Jacobs (tag: 1.0.7) Version Bump
e221f72  2015-12-20 Leon Jacobs Add method to get corp bookmarks
30699d3  2015-12-20 Leon Jacobs Add method to get character bookmarks
afd7cba  2015-12-18 Leon Jacobs Add method to get character chat channels
6ca677b  2015-12-17 Leon Jacobs Second attempt at fixing eveseat/seat#7
```
### 1.0.10
```
e985e13  2015-12-24 Leon Jacobs (tag: 1.0.10) Version Bump
9e75900  2015-12-24 Leon Jacobs Revert version setting via ~
cd3878c  2015-12-24 Leon Jacobs (tag: 1.0.9) Version Bump
a0c30a9  2015-12-24 Leon Jacobs Version Set via ^
ebd21c7  2015-12-24 Leon Jacobs (tag: 1.0.8) Version Bump
e7a055d  2015-12-24 Leon Jacobs Set composer versions using ~
08a50d8  2015-12-24 Leon Jacobs Determine capacity bonus with tower
aa51300  2015-12-24 Leon Jacobs Temporarily ignore nested groups
5ff8e0a  2015-12-23 Leon Jacobs Add methods to get starbase related data
63e9be9  2015-12-21 Leon Jacobs Return paginated results
```
### 1.0.8
```

```
### 1.0.9
```
cd3878c  2015-12-24 Leon Jacobs (tag: 1.0.9) Version Bump
a0c30a9  2015-12-24 Leon Jacobs Version Set via ^
```
### 1.0.11
```
bb1cd45  2015-12-27 Leon Jacobs (tag: 1.0.11) Version Bump
0d139b2  2015-12-27 Leon Jacobs Allow starbase details to be loaded by starbase_id
e985e13  2015-12-24 Leon Jacobs (tag: 1.0.10) Version Bump
9e75900  2015-12-24 Leon Jacobs Revert version setting via ~
```
### 1.0.12
```
c3d9aaf  2015-12-28 Leon Jacobs (tag: 1.0.12) Version Bump
bee194f  2015-12-28 Leon Jacobs Add method to get corporation customs offices
```
### 1.0.13
```
e33ed92  2015-12-29 Leon Jacobs (tag: 1.0.13) Version Bump
582d719  2015-12-29 Leon Jacobs Fix eveseat/seat#28
```
### 1.0.14
```
e4d521b  2016-01-26 Leon Jacobs (tag: 1.0.14) Version Bump
96c9fb5  2016-01-26 Leon Jacobs Update copyright
c9cd51c  2016-01-26 Leon Jacobs Ensure that people.view role is enforced
2f1e9e3  2016-01-26 Leon Jacobs Add methods for People groups
f7bb649  2016-01-06 Leon Jacobs Handle some unicode characters for cases like eveseat/seat#13
0ad1ffa  2016-01-06 Leon Jacobs Code style fix
```
### 1.0.15
```
570bbd0  2016-04-14 Leon Jacobs (tag: 1.0.15) Version Bump
630b8af  2016-04-13 Leon Jacobs Remove unused pagination and CS fixes
cbc4206  2016-04-13 dysath  Services for Corporation Ledger queries. (#5)
b87d364  2016-01-27 Leon Jacobs Order jobs by creation date
```
### 1.0.16
```
439fbac  2016-04-29 Leon Jacobs (tag: 1.0.16) Version Bump
ea240c7  2016-04-29 Leon Jacobs Add defaults for minimum access mask checking settings
d7b7eaf  2016-04-29 Leon Jacobs Add the search service
ce085f7  2016-04-29 Leon Jacobs Fix eveseat/seat#93 by filtering corporation_account_balances too
0c03b8e  2016-04-29 Leon Jacobs Modify timeline method to retrive one specific message
```
### 1.0.17
```
e35f552  2016-05-14 Leon Jacobs (tag: 1.0.17) Version Bump
10c4a86  2016-05-13 Leon Jacobs Set default values for 'allow_sso'
```
### 1.0.18
```
b3d538d  2016-06-26 Leon Jacobs (tag: 1.0.18) Version Bump
305a3ab  2016-06-26 Leon Jacobs Sort killmails by newest first.
2edf0fd  2016-06-26 Leon Jacobs Add module info if a single starbases' info is called
```
### 1.0.19
```
b2b9995  2016-07-10 Leon Jacobs (tag: 1.0.19) Version Bump
744e982  2016-07-10 Leon Jacobs Paginate Killmails
5711563  2016-07-10 Leon Jacobs Paginate contracts. Part of the fix for eveseat/seat#111
```
### 1.0.20
```
cfcefda  2016-07-23 Leon Jacobs (tag: 1.0.20) Version Bump
7fa3040  2016-07-23 Leon Jacobs Add missing import of CharacterSheetCorporationTitles
b4a8080  2016-07-23 Leon Jacobs Set available options and defaults for usage tracking
b2765c6  2016-07-23 Leon Jacobs Add analytics Jobs using Google Analytics measurement protocol.
9d23cb6  2016-07-22 Loïc LEUILLIOT * Add corporation titles to character sheet (#7)
26c1673  2016-07-19 Leon Jacobs Fix eveseat/seat#112 by using an advanced where to group the filter
58cfc96  2016-07-18 Leon Jacobs Add the `seat:queue:clear-expired` scheduled command
```
### 1.0.21
```
0ad3ccf  2016-07-23 Leon Jacobs (tag: 1.0.21) Version Bump
```
### 1.0.22
```
a0a0c75  2016-07-27 Leon Jacobs (tag: 1.0.22) Version Bump
02ad71e  2016-07-27 Leon Jacobs Seed the expired job time to run every 6 hours
```
### 1.0.23
```
49bc082  2016-10-14 Leon Jacobs (tag: 1.0.23) Version Bump
a199fa9  2016-10-13 Leon Jacobs Add getCharacterAlliances method
dfaa83a  2016-08-25 Leon Jacobs Add char and corp minimum mask defaults
4739b90  2016-08-25 Leon Jacobs Add a default for the `installed_sde` setting
```
### 2.0.0-alpha1
```
95f0453  2016-11-26 Leon Jacobs (tag: 2.0.0-alpha1) Update composer for 2.0 packages and version 2.0.0-alpha1
3367168  2016-11-25 Leon Jacobs Add more data sources for the dashboard.
0da12f3  2016-11-25 Leon Jacobs Allow specifying which tags to exclude when cleaning html.
e87cb20  2016-11-25 Leon Jacobs Fix member tracking counts by using a leftJoin.
f70db5f  2016-11-25 Leon Jacobs Dont override existing schedules when seeding the database.
2cbaf0f  2016-11-20 Leon Jacobs Allow carbon helper to be called without an argument.
41a9b07  2016-11-19 Leon Jacobs Add `updateNote` method.
a1c72d6  2016-11-19 Leon Jacobs Add Trait that allows adding notes to any model.
dc81167  2016-11-17 Leon Jacobs Return an unresolved query for datatables to work with.
e3437ca  2016-11-17 Leon Jacobs Join invTypes to get the contact type
d804d7e  2016-11-16 Leon Jacobs Return raw query builder objects for use with datatables
3b1cc16  2016-11-15 Leon Jacobs Prevent overriding existing functions.
eca05dd  2016-11-15 Leon Jacobs Alloe setting settings values using the helper.
c62da72  2016-11-13 Leon Jacobs Remove stale usages of the old `Filterable` trait.
68e28c9  2016-11-13 Leon Jacobs Allow for repo queries to return unresolved.
5ae8c91  2016-11-11 Leon Jacobs Add flag to return unresolved queries for datatables.
bdb2ba0  2016-11-08 Leon Jacobs Add Intel repository
f65548e  2016-11-05 Leon Jacobs Code formatting fixes
6ccfb97  2016-11-05 Leon Jacobs Paginate market orders
720e5cb  2016-11-04 Leon Jacobs Use logger() helper
1ad9cfb  2016-11-04 Leon Jacobs Remove `array_flatten()` as collections are returned
d8ddbb0  2016-11-04 Leon Jacobs Fix column ambiguity
d1d46cf  2016-10-30 Leon Jacobs Remove return type as it can be null
d13d650  2016-10-25 Leon Jacobs Refactor Corporation repo to use structured classes
ab9f039  2016-10-25 Leon Jacobs Refactor the Character repository to use seperate classes
3f7a1f9  2016-10-23 Leon Jacobs Return a single value instead of array
6b0aa6c  2016-10-23 Leon Jacobs Remove usage of `collect()`. Collections are returned by default
7784321  2016-10-23 Leon Jacobs Update PHP & Laravel dependencies
1de059b  2016-10-23 Leon Jacobs Log queries based on the value of `DB_DEBUG`
c5ac762  2016-10-21 Leon Jacobs Revert groupBy changes introduced in 982b8661
ee0ff98  2016-10-21 Leon Jacobs Upgrade to coduo/php-humanizer 2.0
869f330  2016-10-21 Leon Jacobs Fix namespace change for humanizer 2.0
982b866  2016-10-21 Leon Jacobs Fix strict mode groupBy constraints
3f1f2c5  2016-10-21 Leon Jacobs Make the query debugger listen on the DB facade directly.
0ff8a45  2016-10-17 Leon Jacobs Fix Job to match L5.3 changes
ac59839  2016-10-17 Leon Jacobs Rename lists() to pluck()
5dc3ac7  2016-10-15 Leon Jacobs Get the value with `value()` instead of `pluck()`
```
### 2.0.0-alpha2
```
69ad918  2016-11-26 Leon Jacobs (tag: 2.0.0-alpha2) Drop minimum stability, add prefer-stable and bump to 2.0.0-alpha2.
```
### 2.0.0
```
b3fdb7a  2016-12-08 Leon Jacobs (tag: 2.0.0) Version Bump! 2.0.0! ⚡️
cdde3d0  2016-12-08 Leon Jacobs Format and style fixes.
95eee16  2016-11-30 Leon Jacobs Allow longer values in the global settings.
b64e55b  2016-11-29 Leon Jacobs Add default for api_constraint
77822f5  2016-11-29 Leon Jacobs Formatting and style fixes.
ae73811  2016-11-28 Leon Jacobs Add methods for searching.
dcc872f  2016-11-28 Leon Jacobs Return a unresolved query.
ac10ed1  2016-11-28 Leon Jacobs Rename getAllCharactersWithAffiliations method.
0277069  2016-11-27 Leon Jacobs Move character skills graph info from the Stats to Character repo.
7a2ca83  2016-11-27 Loïc LEUILLIOT add skills related chart (#10)
5f2f09f  2016-11-26 AsherST Fix where clause for PI (#11)
```
### 2.0.1
```
e51c35d  2016-12-11 Leon Jacobs (tag: 2.0.1) Version Bump
2209e71  2016-12-11 Leon Jacobs Remove return type as it can be null too
eb58671  2016-12-11 Leon Jacobs Fix member tracking query to return correct key statuses.
22f1d42  2016-12-11 Leon Jacobs Add default value for require_activation
```
### 2.0.2
```
de658a8  2016-12-15 Leon Jacobs (tag: 2.0.2) Version Bump
aaec7d7  2016-12-15 Leon Jacobs Formatting fixes.
0bde264  2016-12-15 Loïc LEUILLIOT implement a custom method dedicated to search for ApiKey (#12)
8203f69  2016-12-14 Leon Jacobs Add function to parse evemail threads.
```
### 2.0.3
```
33be7aa  2016-12-16 Leon Jacobs (tag: 2.0.3) Version Bump
17fcaec  2016-12-16 Leon Jacobs Add new mail_threads option
d966f59  2016-12-16 Leon Jacobs Add method to remove job tracking items
```
### 2.0.4
```
9e68e86  2016-12-22 Leon Jacobs (tag: 2.0.4) Version Bump
9041297  2016-12-22 Leon Jacobs Dont prefix cache keys with the session_id
```
### 2.0.5
```
fc82256  2016-12-22 Leon Jacobs (tag: 2.0.5) Version Bump
1a56751  2016-12-22 Leon Jacobs Only prefix user keys with the session_id
```
### 2.0.6
```
318fc64  2016-12-28 Leon Jacobs (tag: 2.0.6) Version Bump
637e566  2016-12-26 Leon Jacobs Add methods to get contract items
bc09a37  2016-12-26 Leon Jacobs Formatting and code style fixes
84dfae6  2016-12-26 freedenizen Add assetContents collection for Character Assets view (#14)
2efc1ff  2016-12-26 Loïc LEUILLIOT including level in skill coverage chart (#13)
```
### 2.0.7
```
462fd5c  2017-01-12 Leon Jacobs (tag: 2.0.7) Version Bump
0be2e39  2017-01-12 freedenizen Character assets (#16)
44c6db5  2017-01-04 Leon Jacobs Update styleci config
e36d874  2017-01-02 Leon Jacobs Apply fixes from StyleCI (#15)
2ecf750  2017-01-02 Leon Jacobs Add StyleCI configuration & badge
4a232d1  2017-01-01 Leon Jacobs Style fixes
```
### 2.0.8
```
f0074be  2017-01-22 Leon Jacobs (tag: 2.0.8) Version Bump
9144305  2017-01-22 Leon Jacobs Apply fixes from StyleCI (#17)
f29b680  2017-01-22 Leon Jacobs Add `childContentCount` field for assets
42adef9  2017-01-20 Leon Jacobs Add codeclimate configuration
```
### 2.0.9
```
1095543  2017-04-17 Leon Jacobs (tag: 2.0.9) Version Bump
dc46c73  2017-02-19 moe-alabel Modified cron statements to proper format. Changed from 6 positions to 5 (#18)
```
### 2.0.10
```
3feccc6  2017-07-02 Leon Jacobs (tag: 2.0.10) Version Bump
eb02e76  2017-07-02 Loïc LEUILLIOT avoid null exception on assetlist_locations for starbases trait (#22)
4358497  2017-07-02 BenH    Added support for the 'Render' type (#23)
```
### 2.0.11
```
4658230  2017-08-12 Leon Jacobs (tag: 2.0.11, origin/master, origin/HEAD, master) Version Bump
d1bc5b3  2017-08-12 Leon Jacobs Remove an unused variable and style fixes.
654e4da  2017-08-12 Loïc LEUILLIOT add ACL filters on dashboard stats (#25)
a65f4a4  2017-08-12 Leon Jacobs Style fixes
f4e1c22  2017-08-12 Loïc LEUILLIOT optimise top mail query by dropping join table and exploit getAffiliationMap in order to retrieve the user character IDs (#24)
```
