![SeAT](http://i.imgur.com/aPPOxSK.png)

# services change logs
Generated with: `git log --oneline --decorate`

### 1.0.22
```
a0a0c75 (tag: 1.0.22) Version Bump
02ad71e Seed the expired job time to run every 6 hours
```
### 1.0.21
```
0ad3ccf (tag: 1.0.21) Version Bump
```
### 1.0.20
```
cfcefda (tag: 1.0.20) Version Bump
7fa3040 Add missing import of CharacterSheetCorporationTitles
b4a8080 Set available options and defaults for usage tracking
b2765c6 Add analytics Jobs using Google Analytics measurement protocol.
9d23cb6 * Add corporation titles to character sheet (#7)
26c1673 Fix eveseat/seat#112 by using an advanced where to group the filter (actually eveseat/seat#122)
58cfc96 Add the `seat:queue:clear-expired` scheduled command
```
### 1.0.19
```
b2b9995 (tag: 1.0.19) Version Bump
744e982 Paginate Killmails
5711563 Paginate contracts. Part of the fix for eveseat/seat#111
```
### 1.0.18
```
b3d538d (tag: 1.0.18) Version Bump
305a3ab Sort killmails by newest first.
2edf0fd Add module info if a single starbases' info is called
```
### 1.0.17
```
e35f552 (tag: 1.0.17) Version Bump
10c4a86 Set default values for 'allow_sso'
```
### 1.0.16
```
439fbac (tag: 1.0.16) Version Bump
ea240c7 Add defaults for minimum access mask checking settings
d7b7eaf Add the search service
ce085f7 Fix eveseat/seat#93 by filtering corporation_account_balances too
0c03b8e Modify timeline method to retrive one specific message
```
### 1.0.15
```
570bbd0 (tag: 1.0.15) Version Bump
630b8af Remove unused pagination and CS fixes
cbc4206 Services for Corporation Ledger queries. (#5)
b87d364 Order jobs by creation date
```
### 1.0.14
```
e4d521b (tag: 1.0.14) Version Bump
96c9fb5 Update copyright
c9cd51c Ensure that people.view role is enforced
2f1e9e3 Add methods for People groups
f7bb649 Handle some unicode characters for cases like eveseat/seat#13
0ad1ffa Code style fix
```
### 1.0.13
```
e33ed92 (tag: 1.0.13) Version Bump
582d719 Fix eveseat/seat#28
```
### 1.0.12
```
c3d9aaf (tag: 1.0.12) Version Bump
bee194f Add method to get corporation customs offices
```
### 1.0.11
```
bb1cd45 (tag: 1.0.11) Version Bump
0d139b2 Allow starbase details to be loaded by starbase_id
```
### 1.0.10
```
e985e13 (tag: 1.0.10) Version Bump
9e75900 Revert version setting via ~
```
### 1.0.9
```
cd3878c (tag: 1.0.9) Version Bump
a0c30a9 Version Set via ^
```
### 1.0.8
```
ebd21c7 (tag: 1.0.8) Version Bump
e7a055d Set composer versions using ~
08a50d8 Determine capacity bonus with tower
aa51300 Temporarily ignore nested groups
5ff8e0a Add methods to get starbase related data
63e9be9 Return paginated results
```
### 1.0.7
```
5734db7 (tag: 1.0.7) Version Bump
e221f72 Add method to get corp bookmarks
30699d3 Add method to get character bookmarks
afd7cba Add method to get character chat channels
6ca677b Second attempt at fixing eveseat/seat#7
```
### 1.0.6
```
aa17e7d (tag: 1.0.6) Version Bump
691dc5c Prevent dupe or corp chars from showing
1b93322 Prevent duplicate entries in corp member tracking
```
### 1.0.5
```
af4abdc (tag: 1.0.5) Version Bump
cda2f34 Default to english language
ea02832 Add method to get mail timeline
28b0933 Suppress errors incase the html is invalid
012e0e6 Add method to get an email for a character
```
### 1.0.4
```
d087604 (tag: 1.0.4) Version Bump
d3d6bd0 Add an admin contact setting
a5b4135 Order jobs by date
```
### 1.0.3
```
e1c75bb (tag: 1.0.3) Version Bump
```
### 1.0.2
```
717f9fb (tag: 1.0.2) Add server status method
f2172dc Update README.md
8b65137 Add default MFA setting
```
### 1.0.1
```
f32b199 (tag: 1.0.1) Version Bump
9a2fe0f Allow to get/set settings for another user by id
71504e9 Add default for email notifications
8109b5c Add service for database stored schedules
d4afc21 Ensure we pass integers to the helper
```
### 1.0.0
```
300cdde (tag: 1.0.0) Update required eveseat package version
526493c Style Fixes and Version Bump
9ded93d Add registration options
e5348f0 Update to support new settings features
f601b60 Move options scope to public
dcbd238 Add a setting() helper and provide some defaults
82115c2 Add a settings service
c72cd8a Add methods to query corp security info
5371848 Add method to get corp member tracking
```
### 1.0-pre-alpha
```
93958d6 (tag: 1.0-pre-alpha) Update README
666036a Add method to get corp wallet transactions
bcb36f7 Fix filter rule reference
5e579ec Add methods to get standings and wallet journal
91163b3 Fix a join
bab5d59 Add method to get corp market orders
6b2734d Add method to get corp killmails
513c1e5 Add method to get corp industry jobs
eb0b9d7 Add method to get corp contracts
3b2e7eb Add methods to get corp contacts & labels
057e1d4 Add method to get corp assets
907870a Add methods for corp summary pages
c4a4977 Small refactor to remove attributes instead of making them blank
0b1ee7a Add method to cleanup CCP produced HTML
11e55c6 Add method to list corporations
3a76e64 Fix typo
02eea36 Add ability to just dump query and continue load
c71ca03 Add method to get character standings
be1c6db Add method to get character research info
7d0105c Add method to get character pi
6ea00fb Add methods to get character market orders
18e3580 Add method comments
4daabd8 Add method to get character industry
196e968 Add method to get contract information
3ad8de1 Add method to get killmails
2c5ca99 Lock type image to max 32/64px
0071fa7 Add character contact lists and calendar repositories
11ebe15 Add character notifications repo
52807cf Add the Notification Types Seeder
6560b34 Add rules to ensure columns can not be tampered with
bb32b1b Add Character Assets services
cc493be Style fixes
0e56275 Add Mail Service for Characters
6fa7631 Add Character Wallet Transactions Service
bd1b364 Add Wallet Journal Services
22d7e6f Add option to auto-detect image types
f899060 Rename method from Character->Eve
d3f6fb7 Add more methods for character information
46910d1 Fix a table ambiguity problem for characterID
33463b9 Add more repository methods
f75cd7c Add Services for Character Skills
d35099a Add security repository
9bcb126 Add more methods for character info
71e3864 Add a number formatter
55a29d2 Add repositories to get character information
04df3b9 Add a query builder filterable helper
0fdea02 Add SQL debug helper
6e32c77 Add Respository to support the Queue
54cda05 Set extention correctly based on image type
4172206 Add a service to prepare lazy loaded <img> tags
89dfbb2 Add user modifiction services
30bdace Add repositories used in eveseat/web acl
a8ff125 Update to match eveseat/eveapi Model refactor
4a69ce0 Add Config file
ea84fb0 Add Queue Data Source
2f60e1d Add EveApiKeyData service
467fb42 Update badges
5779eff Prepare repository for packagist
a46f437 Initial commit
```
