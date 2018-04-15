![SeAT](https://i.imgur.com/aPPOxSK.png)

# web change logs
Generated with: `git log --pretty=format:"%h%>(12)%ad %<(7)%aN%d %s" --date=short`

### 1.0-pre-alpha
```
6332cd7  2015-11-27 Leon Jacobs (tag: 1.0-pre-alpha) Update README
a48340a  2015-11-27 Leon Jacobs Login using names instead of emails
2dfdc27  2015-11-27 Leon Jacobs Add ability to view corp wallet transactions
06c4741  2015-11-27 Leon Jacobs Add ability to view corp wallet journals
97547a7  2015-11-27 Leon Jacobs Add ability to view corp standings
1a825e0  2015-11-27 Leon Jacobs Add ability to view corp market orders
bab5d6a  2015-11-27 Leon Jacobs Add ability to view corp killmails
26923cc  2015-11-27 Leon Jacobs Add ability to view corporation industry jobs
fc43803  2015-11-27 Leon Jacobs Add ability to view corporation contracts
a386881  2015-11-27 Leon Jacobs Add ability to view corp contacts
110b142  2015-11-27 Leon Jacobs Add ability to view corporation assets
2b9dd85  2015-11-27 Leon Jacobs Add ability to view corp summary
0bf5bdc  2015-11-26 Leon Jacobs First work on corporation views.
5114d4f  2015-11-26 Leon Jacobs Resolve a trait method conflict
5eaffdc  2015-11-21 Leon Jacobs Add ability to mass import keys via CSV files
17feb08  2015-11-21 Leon Jacobs Add ability to view character standings
797c9f0  2015-11-21 Leon Jacobs Add ability to view character research info
771ee34  2015-11-21 Leon Jacobs Add ability to view character PI
0fcb7de  2015-11-21 Leon Jacobs Add ability to view character market orders
a6b7ac6  2015-11-20 Leon Jacobs Add ability to view character industry
c020c36  2015-11-20 Leon Jacobs Small UI refactor to make it cleaner
0d5e18a  2015-11-20 Leon Jacobs Add character contract view
f36e34b  2015-11-20 Leon Jacobs Add ability to view character killmails
45e8dd5  2015-11-20 Leon Jacobs Link to character details
08d1d48  2015-10-30 Leon Jacobs Add character contacts view
dc3a396  2015-10-30 Leon Jacobs Add character calendar view
085368f  2015-10-30 Leon Jacobs Add character notifications view
04ca0ee  2015-10-30 Leon Jacobs Add filter rules.
ccc5ad2  2015-10-30 Leon Jacobs Add Character Assets View
c748d29  2015-10-29 Leon Jacobs Add table-responsive
9aaa7ae  2015-10-29 Leon Jacobs Add Character Mail View
f046272  2015-10-29 Leon Jacobs Add Character Wallet Transaction View
1ae69e0  2015-10-29 Leon Jacobs Add Character Wallet Journal View
814a95d  2015-10-29 Leon Jacobs Rename method from EveRepository
5d9cfc1  2015-10-28 Leon Jacobs Add Implants, Jump Fatigue and Clone info
ac83d39  2015-10-28 Leon Jacobs Minor formatting changes
3631b89  2015-10-28 Leon Jacobs Re-arrange character details layout
e23a153  2015-10-27 Leon Jacobs Add more character sheet info and shuffle a few things around
c414bb2  2015-10-27 Leon Jacobs Create a base view for character detail views
d3fc448  2015-10-27 Leon Jacobs Add Character Skills view
51caf72  2015-10-09 Leon Jacobs Add Security logging and viewing abilities
7debd56  2015-10-09 Leon Jacobs Start the Character Viewer
5bfbed0  2015-10-09 Leon Jacobs Small responsive fixes
4cf03ed  2015-10-08 Leon Jacobs Add All Characters View
51ccf46  2015-10-08 Leon Jacobs Add hasAny()
12e05de  2015-10-07 Leon Jacobs Split permissions into categories
50a68ab  2015-10-06 Leon Jacobs Add a view into the Job Queue as well as some management
0da342b  2015-10-06 Leon Jacobs Add live queue status updates
b9df4c4  2015-10-06 Leon Jacobs Fix cases where keys with missing info would throw errors
9faffab  2015-10-06 Leon Jacobs Remove usage of the Redirect Facade
2250508  2015-10-05 Leon Jacobs Add ability to manually start a job update
3e34b3e  2015-10-05 Leon Jacobs Add key detail viewer and introduce the keybouncer
85bf567  2015-10-05 Leon Jacobs Add ability ti list and delete API keys
2fe3d76  2015-10-04 Leon Jacobs Add lazy image loading support
ee21c49  2015-10-04 Leon Jacobs Style fixes
1de991a  2015-10-04 Leon Jacobs Add ability to add new Api Keys
358ba7f  2015-10-04 Leon Jacobs Make sidebar permissions aware
41190e6  2015-10-02 Leon Jacobs Introduce the Bouncer and hes Clipboard 🚪
c2edc6b  2015-10-02 Leon Jacobs Use auth() helper instead of Auth Facade
2a864dc  2015-10-02 Leon Jacobs Fix some inconsistency with edit/updater user lang
e473bba  2015-10-02 Leon Jacobs Swap input for has to read better
5e65509  2015-10-02 Leon Jacobs Allow for users to be quick added
89ca4e1  2015-10-02 Leon Jacobs Allow for the account status to be filled
05e6019  2015-10-02 Leon Jacobs Resize grid to match other configuration views
fdeb2cc  2015-10-02 Leon Jacobs Rename menu entry to match page title
7a03e34  2015-10-02 Leon Jacobs Complete the impersonation feature
6195979  2015-10-02 Leon Jacobs Add ability to delete users
0675ef9  2015-10-02 Leon Jacobs Cleanup when a user is deleted
4c58659  2015-10-02 Leon Jacobs Allow for users to be modified
a3f1882  2015-10-01 Leon Jacobs Add a basic summary of user roles and affiliations
f03f872  2015-09-30 Leon Jacobs Localize flash messages on perm/role changes
679b020  2015-09-30 Leon Jacobs Fix typo in affiliation form request validator
2e656a8  2015-09-30 Leon Jacobs First iteration of Acl methods and web structuring.
e8c4343  2015-09-29 Leon Jacobs Highlight submenu items based on URL match
b6cd2b9  2015-09-29 Leon Jacobs Have the sidebar honor the Locale
1f91ef0  2015-09-29 Leon Jacobs Add view composer to build the sidebar menu
3425769  2015-09-28 Leon Jacobs Add a User view composer
3e72326  2015-09-28 Leon Jacobs Restructure Service Provider
4aa96f5  2015-09-27 Leon Jacobs Fix duplicate 'reset' translation key
1160deb  2015-09-27 Leon Jacobs Use class property
22c7747  2015-09-27 Leon Jacobs Add password reset functionality
9377f67  2015-09-27 Leon Jacobs Add README
f16a71d  2015-09-27 Leon Jacobs Start web interface
3f15794  2015-09-24 Leon Jacobs Initial commit
```
### 1.0.0
```
e885f07  2015-11-28 Leon Jacobs (tag: 1.0.0) Style fixes and version Bump
fddc5ba  2015-11-28 Leon Jacobs Add SeAT Settings Page with registration toggle
30b2b9c  2015-11-28 Leon Jacobs Add more settings options
bb6e8ed  2015-11-28 Leon Jacobs Add ability to change SeAT theme.
8dbb713  2015-11-28 Leon Jacobs Read skin ccs filename from settings()
67d823c  2015-11-28 Leon Jacobs Read some values from settings
91872a1  2015-11-27 Leon Jacobs Remove unused HTML and fix brand route
3ec66f3  2015-11-27 Leon Jacobs Reduce icon size and add corp icons
e78c62f  2015-11-27 Leon Jacobs Add more complete corp security views
13f6c9d  2015-11-27 Leon Jacobs Add ability to view corp member tracking
```
### 1.0.1
```
4598815  2015-12-01 Leon Jacobs (tag: 1.0.1) Version Bump
2c683ba  2015-12-01 Leon Jacobs Dont force a package to have a sub-menu
6c13e32  2015-12-01 Leon Jacobs Resolve menu routes in the sidebar view.
e8f3237  2015-11-30 Leon Jacobs Add api version display
0f6d4ec  2015-11-30 Leon Jacobs First pass in allowing packages to add menu items
fe117ce  2015-11-30 Leon Jacobs Add hasRole() method
be056a9  2015-11-30 Leon Jacobs Fix #2
```
### 1.0.2
```
7fcac57  2015-12-02 Leon Jacobs (tag: 1.0.2) Version Bump
020c885  2015-12-02 Leon Jacobs Add notifications version
f9fdaf6  2015-12-02 Leon Jacobs Dont force packages to set a permission
5d1bb8c  2015-12-02 Leon Jacobs Add email notifications setting and new email templates
4bade0d  2015-12-02 Leon Jacobs Auto update copyright year
9eba303  2015-12-02 Leon Jacobs Add WebUI to manage schedules
```
### 1.0.3
```
bc8e6eb  2015-12-04 Leon Jacobs (tag: 1.0.3) Start something for a dashboard
0238e32  2015-12-04 Leon Jacobs Update README.md
73d415d  2015-12-04 Leon Jacobs Add optional Google Two-Factor TOTP support.
84723ff  2015-12-03 Leon Jacobs Merge pull request #3 from Cynabal/patch-1
2d98ead  2015-12-03 Cynabal Update add.blade.php
```
### 1.0.4
```
4aab9b8  2015-12-05 Leon Jacobs (tag: 1.0.4) Version Bump
```
### 1.0.5
```
df6ddae  2015-12-13 Leon Jacobs (tag: 1.0.5) Version Bump
14bc397  2015-12-13 Leon Jacobs Add ability to set an admin contact
5e6498b  2015-12-12 Leon Jacobs Add links to external services
f819124  2015-12-12 Leon Jacobs Show output of jobs
070c232  2015-12-12 Leon Jacobs Show eveapi errors status
80775e2  2015-12-11 Leon Jacobs Allows superusers to transfer keys to other owners
```
### 1.0.6
```
2042098  2015-12-16 Leon Jacobs (tag: 1.0.6) Version Bump
83a7ea8  2015-12-16 Leon Jacobs Add Afrikaans language support
0039045  2015-12-16 Leon Jacobs Add ability to select a preferred language
30a71e6  2015-12-16 Leon Jacobs Update langauge strings
2956a15  2015-12-15 Leon Jacobs Resolve contract issuerID's to names
36ea925  2015-12-15 Leon Jacobs Apply number() to a few values
40e5c24  2015-12-15 Leon Jacobs Add ability to view profile login/logout history
a8e93d7  2015-12-15 Leon Jacobs Add for user password resets
81682c4  2015-12-15 Leon Jacobs Add recipient info into the mail timeline
cc141c8  2015-12-15 Leon Jacobs Add id-to-name helper
6999007  2015-12-15 Leon Jacobs Add X-CSRF Token for ajax calls
6915fec  2015-12-15 Leon Jacobs Add the mail timeline view
5ade565  2015-12-14 Leon Jacobs Add ability to view character email
```
### 1.0.7
```
660b6fa  2015-12-17 Leon Jacobs (tag: 1.0.7) Version Bump
b65aa7e  2015-12-17 Leon Jacobs Remove URI scheme
639b3fb  2015-12-17 Leon Jacobs Add missing language definition for view
```
### 1.0.8
```
0ece0ce  2015-12-17 Leon Jacobs (tag: 1.0.8) Version Bump
616067c  2015-12-17 Leon Jacobs Check if we have data before attempting to display
99c14a3  2015-12-17 Leon Jacobs Fix eveseat/seat#10
```
### 1.0.9
```
9e4cd79  2015-12-17 Leon Jacobs (tag: 1.0.9) Add account info check and Version Bump
bfaabe2  2015-12-17 Leon Jacobs Merge pull request #4 from freedenizen/master
d802b98  2015-12-17 Asher Schaffer add updated_at timestamps to Character and Corporation Sheet summary
```
### 1.0.10
```
5aebf1e  2015-12-18 Leon Jacobs (tag: 1.0.10) Allow French to be chosen and Version Bump
dae1719  2015-12-18 Leon Jacobs Merge pull request #5 from warlof/french
6e827ae  2015-12-17 elfaus  Translate SeAT in french according to 1.0.9
```
### 1.0.11
```
ca67d0a  2015-12-20 Leon Jacobs (tag: 1.0.11) Version Bump
78da260  2015-12-20 Leon Jacobs Add ability to view corporation bookmarks
eda1260  2015-12-19 Leon Jacobs Add ability to view character bookmarks
8e1285e  2015-12-18 Leon Jacobs Add ability to view character channels
```
### 1.0.12
```
7bdbf10  2015-12-24 Leon Jacobs (tag: 1.0.12) Version Bump
6c365ad  2015-12-24 Leon Jacobs Specify versions with ~
3f604e2  2015-12-24 Leon Jacobs Merge pull request #11 from warlof/french
c1f4657  2015-12-24 elfaus  add new translations according to recent commits (for 1.0.12)
ed485b3  2015-12-24 Leon Jacobs Move strontium usage to its own string for easier translation
64a6f86  2015-12-24 Leon Jacobs Take into account bonusses silo/coupling array capacities
488fd3b  2015-12-24 Leon Jacobs Merge pull request #8 from warlof/unknown-item
cd66a8a  2015-12-24 Leon Jacobs Add Starbase details views
f9dc521  2015-12-24 elfaus  fix issue #9
9f74d1c  2015-12-24 Leon Jacobs Add more details about starbases
7e67371  2015-12-23 Leon Jacobs First pass at adding starbase views
9496188  2015-12-21 Leon Jacobs Merge pull request #6 from warlof/french
2491e69  2015-12-21 elfaus  Translate SeAT in french according to 1.0.11
f5fa4e3  2015-12-21 Leon Jacobs Show timestampts and paginate wallet info
c6b4311  2015-12-21 Leon Jacobs Fix eveseat/seat#15
```
### 1.0.13
```
936e8b8  2015-12-24 Leon Jacobs (tag: 1.0.13) Fix a assets check, add missing string and Version Bump
```
### 1.0.14
```
3f8587c  2015-12-26 Leon Jacobs (tag: 1.0.14) Version Bump
14d87b4  2015-12-26 Leon Jacobs Merge pull request #13 from warlof/ticket5
d412b7e  2015-12-26 Leon Jacobs Excluse Towers themselves from module views
98a8e19  2015-12-26 Leon Jacobs Use a macro for progressbar generation
c0e9ce3  2015-12-26 Leon Jacobs Remove unused variables
22932b4  2015-12-26 Leon Jacobs Refactor Starbase views mostly for performance reasons
0cefaac  2015-12-25 elfaus  fix issue #5 about labels display on neutral and negative standing
```
### 1.0.15
```
bbede7b  2015-12-27 Leon Jacobs (tag: 1.0.15) Version Bump
63f308a  2015-12-27 Leon Jacobs Load starbase modules via Ajax calls
c0f48df  2015-12-27 Leon Jacobs Display page render time
```
### 1.0.16
```
075784c  2015-12-28 Leon Jacobs (tag: 1.0.16) Version Bump
b688c4f  2015-12-28 Leon Jacobs Add planet type icons
54ccdec  2015-12-28 Leon Jacobs Add corporation Pocos view
```
### 1.0.17
```
ec9d5c8  2015-12-29 Leon Jacobs (tag: 1.0.17) Version Bump
aaaac36  2015-12-29 Leon Jacobs Fix eveseat/seat#29
6de7e1e  2015-12-29 Leon Jacobs Add Datatables for tables.
```
### 1.0.18
```
69239bf  2016-01-03 Leon Jacobs (tag: 1.0.18) Version Bump
33470ce  2016-01-03 Leon Jacobs Allow packages to hook into corporation menus
24c9f1d  2016-01-03 Leon Jacobs Only attempt to read package menus if they are defined
3b7ecad  2016-01-03 Leon Jacobs Allow packages to hook into character menus
bac4a6e  2015-12-29 Leon Jacobs Add Datatables to starbase summary
```
### 1.0.19
```
f212c78  2016-01-26 Leon Jacobs (tag: 1.0.19) Version Bump
d5376f9  2016-01-26 Leon Jacobs Update Copyright
39c8243  2016-01-26 Leon Jacobs Subclass the bouncers
afb0be5  2016-01-26 Leon Jacobs Add a People Groups feature
17c4f3e  2016-01-11 Leon Jacobs Set queue status update time via configuration
5d30ff0  2016-01-08 Leon Jacobs Fix eveseat/seat#48 by adding data-order attributes
530c268  2016-01-07 Leon Jacobs Add a check for loaded modules and php version
c84baaa  2016-01-07 Leon Jacobs Merge pull request #18 from warlof/ticket38
e4e1fd0  2016-01-07 Leon Jacobs Merge pull request #20 from warlof/ticket43
94e470d  2016-01-05 elfaus  Fix wishlist #38 eveseat/seat#38
21a3bb3  2016-01-06 elfaus  Fix issue eveseat/seat issues#43 - Update calc formula - Adding ceil in order to get round item unit (ccp like)
274409b  2016-01-06 Leon Jacobs Use league/csv to parse CSV's instead of the homebrew
741755d  2016-01-06 Leon Jacobs Remove unnecessary re-fetch of model data
b7ff1a2  2016-01-06 Leon Jacobs Fix eveseat/seat#39 by changing ownership of an existing key.
8fcc13e  2016-01-06 Leon Jacobs Remove footer. Datatables will count the keys
b357826  2016-01-06 Leon Jacobs Code formatting fixes
d5f58de  2016-01-06 Leon Jacobs Merge pull request #19 from Cynabal/master
7a78e2f  2016-01-06 Leon Jacobs Merge pull request #17 from warlof/french
9d2ab0f  2016-01-05 Cynabal Update seat.php
86da25f  2016-01-05 elfaus  New translation according to v1.0.18
```
### 1.0.20
```
e2056a1  2016-01-26 Leon Jacobs (tag: 1.0.20) Version Bump
92986b7  2016-01-26 Leon Jacobs Remove pcntl requirement
ad5f515  2016-01-26 Leon Jacobs Merge pull request #21 from warlof/french
642a832  2016-01-26 elfaus  New french translation according to 1.0.19
```
### 1.0.21
```
70783d8  2016-02-02 Leon Jacobs (tag: 1.0.21) Version Bump
c9188b7  2016-02-02 Leon Jacobs Fix eveseat/seat#60 by using `firstOrNew` instead of create
98b9679  2016-01-27 Leon Jacobs Fix eveseat/seat#51 by always showing the pagination
```
### 1.0.22
```
cc8019a  2016-02-09 Leon Jacobs (tag: 1.0.22) Version Bump
0f02f88  2016-02-09 Leon Jacobs Fix eveseat/seat#59 by adding a unique validation constraint
c69fa2f  2016-02-09 Leon Jacobs Add button to easily re-enable keys
```
### 1.0.23
```
954c178  2016-03-01 Leon Jacobs (tag: 1.0.23) Version Bump
498b868  2016-02-29 Leon Jacobs Fix eveseat/seat#70 by ignoring the current users email in the constraint
8422602  2016-02-29 Leon Jacobs Fix eveseat/seat#57 by adding missing language strings
```
### 1.0.24
```
c20194b  2016-04-14 Leon Jacobs (tag: 1.0.24) Version Bump
eac101f  2016-04-13 Leon Jacobs CS Fixes
f6e3186  2016-04-13 Leon Jacobs Small refactoring and CS fixes
9997914  2016-04-13 dysath  Adding Corporation Wallet Ledger (#23)
```
### 1.0.25
```
168bb3e  2016-04-29 Leon Jacobs (tag: 1.0.25) Version Bump
aee17af  2016-04-29 Leon Jacobs Add ability to force a minimum API access mask.
5101767  2016-04-29 Leon Jacobs Start adding search functionality
b8ac4fb  2016-04-29 Leon Jacobs Remove accountid as it is not useful data
8604036  2016-04-29 Leon Jacobs Fix eveseat/seat#81 by validating for numeric instead of integers
e1cd641  2016-04-29 Leon Jacobs Fix eveseat/seat#78 by adding a link to view one mail only
60727e4  2016-04-29 Leon Jacobs Warn if the default admin contact is still set. Ref eveseat/seat#77
a5d1f8f  2016-04-28 Leon Jacobs Fix eveseat/seat#65 by setting the key_id in the model
9884772  2016-04-26 Loïc LEUILLIOT fix reinforcement time using API stateTimeStamp (#24)
```
### 1.0.26
```
981ccc4  2016-05-14 Leon Jacobs (tag: 1.0.26) Version Bump
0796b2c  2016-05-13 Leon Jacobs Allow SSO to be enabled/disabled via the web interface.
7a605be  2016-05-13 Leon Jacobs Give accounts a temp email address and flag Sso created accounts
6efc9bf  2016-05-13 Leon Jacobs Add first support for the EVE Online SSO
```
### 1.0.27
```
7689032  2016-05-30 Leon Jacobs (tag: 1.0.27) Version Bump
c036c44  2016-05-30 Leon Jacobs Update Provider with new method name.
```
### 1.0.28
```
4e5225e  2016-06-26 Leon Jacobs (tag: 1.0.28) Version Bump
5b2443b  2016-06-26 Leon Jacobs FIx indentation
f9b6ee8  2016-06-26 James Browning Added total values to the Bounty Prizes and PI monthly ledgers. (#25)
21fc0d9  2016-06-26 Leon Jacobs Remove logic that is now in the service repository.
```
### 1.0.29
```
bc76609  2016-07-10 Leon Jacobs (tag: 1.0.29) Version Bump
12a1229  2016-07-10 Leon Jacobs Resolve names of affiliations.
e1c82e3  2016-07-10 Leon Jacobs Paginate character contracts and all killmails
91a5e98  2016-07-10 Leon Jacobs Fix eveseat/seat#111 by paginating the results
3ac3699  2016-07-10 Leon Jacobs Fix eveseat/seat#121 by adding a button to re-enable all keys
a6a8897  2016-07-08 Leon Jacobs Add warning about a autogenerated email from sso
c66c68e  2016-07-08 Leon Jacobs Fix spacing
4aa702d  2016-07-08 Leon Jacobs Small codestyle related fixes
1cca04d  2016-07-08 Loïc LEUILLIOT Provide a way for user to change their email address (#27)
e27d545  2016-06-28 Martin Morling Adjusted setting (#26)
```
### 1.0.30
```
bc1f5ac  2016-07-23 Leon Jacobs (tag: 1.0.30) Version Bump
33b0e03  2016-07-23 Loïc LEUILLIOT Update full api mask (#31)
ec19039  2016-07-23 Leon Jacobs Add link to analytics doc
ccd332d  2016-07-23 Leon Jacobs Add ability to disable tracking completely.
c7372e9  2016-07-22 Loïc LEUILLIOT Add corporation titles to character sheet
b527652  2016-07-22 Loïc LEUILLIOT Add contact tracking links into character and corporation contact list (#30)
```
### 1.0.31
```
9fdea41  2016-10-14 Leon Jacobs (tag: 1.0.31) Version Bump
8d1f8fd  2016-10-14 Leon Jacobs Formatting and style fixes
360e76c  2016-10-14 Loïc LEUILLIOT add SDE version into both footer and settings page (#39)
1db0265  2016-10-13 Leon Jacobs Add alliance name filter to character list
770044c  2016-10-13 Loïc LEUILLIOT Fix permission issues (#38)
7c935df  2016-10-13 Loïc LEUILLIOT add alliance icon and name into character list. fixes eveseat/seat#134
2ad376f  2016-09-06 David Wright Rename EveonlineProvider.php to EveOnlineProvider.php (#36)
edb6543  2016-08-25 Leon Jacobs Fix formatting
584c9e6  2016-08-25 Loïc LEUILLIOT Add collateral amount into contract list (#33)
433f10a  2016-08-25 Leon Jacobs Fix formatting and restore min_access_mask language string
60b7cd6  2016-08-25 Loïc LEUILLIOT Create a new minimum required mask dedicated for corporation (#34)
22c4209  2016-08-25 Loïc LEUILLIOT Add paid-until in Key Details view (depends on PR paid-until branch from eveseat/eveapi) (#32)
```
### 2.0.0-alpha1
```
dd76e24  2016-11-26 Leon Jacobs (tag: 2.0.0-alpha1) Update composer for 2.0 packages and version 2.0.0-alpha1
a408ddf  2016-11-25 Leon Jacobs Add a character wallet spend graph.
ff13f32  2016-11-25 Leon Jacobs Introduce ChartJS and add more dashboard elements.
21067c6  2016-11-22 Leon Jacobs Allow packages to set a permission required for a menu item.
b82aa7d  2016-11-21 Leon Jacobs Use select2 for character selection
db20434  2016-11-21 Leon Jacobs Set main character ID & name on SSO login
7c4868f  2016-11-21 Leon Jacobs Allow for sub menus to be pluralized
685b96d  2016-11-20 Leon Jacobs Add localization for email verification.
5ea1f72  2016-11-20 Leon Jacobs Remove unessesary file
85ad7de  2016-11-20 Leon Jacobs Add email verification to account creation.
6cc2854  2016-11-20 Leon Jacobs Update EVE API status to match new style.
32641e0  2016-11-20 Leon Jacobs Move supervisor status to a panel.
99ae5b6  2016-11-20 Leon Jacobs Prepare status response from a collection instead of a raw array.
241c9a9  2016-11-20 Leon Jacobs Use process group name from config file.
70bb0ff  2016-11-20 Leon Jacobs Bind 'supervisor' as a singleton into the IoC to remove code clutter.
5b88e1b  2016-11-20 Leon Jacobs Move supervisor config ot its own file.
c40bf89  2016-11-20 Leon Jacobs Move available languages to its own config
d3879ac  2016-11-19 Loïc LEUILLIOT Improve queue dashboard by adding supervisor information (#43)
f09384a  2016-11-19 Leon Jacobs Add ability to edit existing notes.
4c30a48  2016-11-19 Leon Jacobs Remove character specific notes model and use services model note trait.
56f316c  2016-11-18 Leon Jacobs First iteration adding notes to the intel section
cf30e2f  2016-11-17 Leon Jacobs Remove intel journal detail
f1f4a17  2016-11-17 Leon Jacobs Allow standings profiles to be built by importing char/corp contacts 👍
0f6c11c  2016-11-17 Leon Jacobs Inject the affected id from the request.
40f2b65  2016-11-17 Leon Jacobs Allow for a standings profile to be deleted.
aed53aa  2016-11-16 Leon Jacobs Move People Groups to the Tools section
a50a741  2016-11-16 Leon Jacobs Remove ajax responses and return json for datatables.
5d55b47  2016-11-16 Leon Jacobs Move the last summaries to datatables
e8813d7  2016-11-16 Leon Jacobs Convert top transactions to datatables view
9b6f2b8  2016-11-16 Leon Jacobs Fix alliance name images
6bb770f  2016-11-15 Leon Jacobs Load mail interactions using datatables.
8712398  2016-11-13 Leon Jacobs Fix typo from `read` to `ready`.
441a612  2016-11-13 Leon Jacobs Sort the character list correctly
debd68e  2016-11-13 Leon Jacobs Do not include the old filter config file
6146dca  2016-11-13 Leon Jacobs Remove state config file of the old `Filterable` trait
5445360  2016-11-13 Leon Jacobs Convert character tables to datatables.
abb48be  2016-11-13 Leon Jacobs Fix Mail menu entry name
94a6c32  2016-11-13 Leon Jacobs Correctly sort by default
f485c03  2016-11-13 Leon Jacobs Include external providers in a seperate method.
fdfd922  2016-11-13 Leon Jacobs Fix indenting
4bae275  2016-11-13 Loïc LEUILLIOT Hide registration link if registration is disabled (#46)
7a0cfcb  2016-11-12 Leon Jacobs Fix searching on corporation killboard
4c04af9  2016-11-11 Leon Jacobs Indenting fixes
a5125e3  2016-11-11 Loïc LEUILLIOT Add two low fuel warning on starbase list (#45)
de8b88c  2016-11-11 Leon Jacobs Convert Corporation tables to data tables.
34c6bc9  2016-11-11 Leon Jacobs Sort Datatables columns by default on fist column
d13c96f  2016-11-11 Leon Jacobs Allow for name resolution to be called by function
f9b0962  2016-11-11 Leon Jacobs Covert Corporation View to use Datatables
e7bd080  2016-11-11 Leon Jacobs Make datatables responsive by default
09714e0  2016-11-11 Leon Jacobs Use the new data tables helper to make search & sorting work
a5e8cbe  2016-11-11 Leon Jacobs Add a JS version of the `human_readable` helper
51340f8  2016-11-11 Leon Jacobs Add javascript using `push` & format fixes
bcc35e0  2016-11-11 Loïc LEUILLIOT Redesign queue dashboard to use a dynamic table (#41)
142bb8a  2016-11-11 Leon Jacobs Add scripts using a `stack` instead of `section`.
a99aeb6  2016-11-10 Leon Jacobs Add yajra/laravel-datatables and convert api key list to datatables
e7d8e07  2016-11-09 Leon Jacobs Start the intel journal detail view.
6dd6312  2016-11-08 Leon Jacobs First rough commit of character intel module! 👾
d7aa864  2016-11-07 Leon Jacobs Formatting fixes
3369f0b  2016-11-06 Leon Jacobs Add ability to mark label as a plural
6dcb3de  2016-11-06 Loïc LEUILLIOT refactoring a bit menu composer in order to define a menu composer type and use config file instead hard coded entry (#44)
ea656b5  2016-11-05 Leon Jacobs Code formatting fixes.
869e26c  2016-11-05 Leon Jacobs Explode the Corporation\ViewController into seperate controllers
e19b350  2016-11-05 Leon Jacobs Paginate market orders
0933c79  2016-11-05 Leon Jacobs Explode Character\ViewController into better managed controllers
b5e6f9f  2016-11-05 Leon Jacobs Extend new core controllers instead of base in App namespace
1890f8a  2016-11-04 Leon Jacobs Redirect to the newly created role
e38c7ba  2016-11-04 Leon Jacobs Add ability to wildcard corporation and character access
5d8ccca  2016-11-04 Leon Jacobs Simply validation using form array validation.
231ea86  2016-11-04 Leon Jacobs Remove `insteadof` as repository refactor removed the need for this
ce1bd67  2016-11-04 Leon Jacobs Change Action to route home
f6fb5f9  2016-11-04 Leon Jacobs Fix translation strings
27bd2c2  2016-11-04 Leon Jacobs Implement Inverse access checking
48160d5  2016-11-03 Leon Jacobs Rename Pillow to AccessManager and add typing
7042418  2016-11-03 Leon Jacobs Fix translation key
896592c  2016-11-03 Leon Jacobs Add support for storing inverse permissions
86ade0b  2016-11-01 Leon Jacobs Add the AuthorizationController and fix the KeyBouncer
d8a412f  2016-10-31 Leon Jacobs Update bouncers to return a redirect instead of view
2d73c70  2016-10-29 Leon Jacobs Update to match new class names in eveapi repo
249c5af  2016-10-28 Leon Jacobs Fix language string
038ba4d  2016-10-25 Leon Jacobs Update to make use of new Corp repository classes
fb129f9  2016-10-25 Leon Jacobs Update to make use of new Character repository classes
799fdee  2016-10-24 Leon Jacobs Update distrib JS/CSS
74752d2  2016-10-23 Leon Jacobs Upgrade to AdminLTE 2.3.7
735279c  2016-10-23 Leon Jacobs Remove usages of `collect()`. All queries return a collection by default
ee461fb  2016-10-23 Leon Jacobs Upgrade `pragmarx/google2fa` & `league/csv` dependencies
e414ecb  2016-10-23 Leon Jacobs Updpate Form Request validation to extend new base class
fe0606d  2016-10-22 Leon Jacobs Show icon of actual ship instead of a generic one
e4821ca  2016-10-18 Loïc LEUILLIOT fix paid-until issue in detail api key view due to possible missing status (#40)
2bef52c  2016-10-17 Leon Jacobs Move logout to a POST method as the new Laravel default
abea1b1  2016-10-17 Leon Jacobs Rename `lists()` to `pluck()`
c215f78  2016-10-15 Leon Jacobs Update Authentication Scaffolding for Laravel 5.3
97fdc4d  2016-10-15 Leon Jacobs Add Notifiable trait introduced in L5.3
6366ccc  2016-10-15 Leon Jacobs Update Events to use new Class based events for L5.3
c45ac15  2016-10-15 Leon Jacobs Update composer to require PHP7 and Laravel 5.3
```
### 2.0.0-alpha2
```
680e4a3  2016-11-26 Leon Jacobs (tag: 2.0.0-alpha2) Drop minimum stability, add prefer-stable and bump to 2.0.0-alpha2.
```
### 2.0.0
```
e648d7e  2016-12-08 Leon Jacobs (tag: 2.0.0) Version Bump! 2.0.0! ⚡️
690f1be  2016-12-08 Leon Jacobs Format and style fixes.
f7ad9a6  2016-12-08 Loïc LEUILLIOT add disable key function (#50)
48069d6  2016-11-30 Leon Jacobs Add a check for cases where api keys may have `null` constraints.
82f1bbb  2016-11-30 Leon Jacobs Move the Validation namespace to Seat\Web\Http\Validation.
55436eb  2016-11-30 Leon Jacobs Allow constraints to be set on specific API keys.
1ab8153  2016-11-29 Leon Jacobs Add message that all workers will run without a constraint set.
d2faf43  2016-11-29 Leon Jacobs First iteration of adding worker constraints.
893f9a9  2016-11-29 Leon Jacobs Formatting and style fixes.
946578d  2016-11-29 Leon Jacobs Change method visibility to private.
f65286c  2016-11-29 Leon Jacobs Small refactoring and code cleanup for the SSO upgrade option.
8583a5c  2016-11-29 Loïc LEUILLIOT fix multiple user creation when user is already owning an account and authenticate with SSO (#49)
c2d4cc7  2016-11-28 Leon Jacobs Correctly sort first search results.
0da3bf0  2016-11-28 Leon Jacobs Add character skills and assets search.
fa2a4fd  2016-11-28 Leon Jacobs Remove return type as there is more than one
8892a83  2016-11-28 Leon Jacobs Show security logs using datatables.
bc2b8f2  2016-11-28 Leon Jacobs Convert Search results to use Datatables.
e259c38  2016-11-27 Leon Jacobs Add skills graphs to character skills view.
26bbed0  2016-11-27 Leon Jacobs Move character skills graphing routes the the CharacterController.
29f8614  2016-11-27 Loïc LEUILLIOT add skills related chart (#48)
```
### 2.0.1
```
00536d7  2016-12-10 Leon Jacobs (tag: 2.0.1) Version Bump
41cc905  2016-12-10 Leon Jacobs Remove trailing brace
b8ed06b  2016-12-10 Leon Jacobs Only display graphs when there is data.
14c547e  2016-12-10 Leon Jacobs Small layout refactor and removal of self account deletion.
d07639f  2016-12-10 Leon Jacobs Log impersonation events.
158b141  2016-12-10 Leon Jacobs Improve impersonation by adding an easy revert option.
5f8ea64  2016-12-10 Leon Jacobs Allow sorting by key status and show disabled reason in details.
986541c  2016-12-10 Leon Jacobs Fix global worker constraints view.
536880c  2016-12-10 Leon Jacobs Update datatables version constraint as newer versions are broken.
edb4f27  2016-12-09 Leon Jacobs Fix eveseat/seat#152 by instantiating with `moment.utc`.
```
### 2.0.2
```
e7590c3  2016-12-10 Leon Jacobs (tag: 2.0.2) Version Bump
7d00d54  2016-12-10 Leon Jacobs Limit keys returned based on permissions
```
### 2.0.3
```
e960118  2016-12-11 Leon Jacobs (tag: 2.0.3) Version Bump
d30202a  2016-12-11 Leon Jacobs Update view to check new key status field
3f826f8  2016-12-11 Leon Jacobs Add option to disable email activation requirement.
a388a5d  2016-12-11 Leon Jacobs Use `setting()` helper instead of static Class method
55cfca3  2016-12-11 Loïc LEUILLIOT fixing possible issue with Supervisor Monitor setting (#51)
```
### 2.0.4
```
3d2f6b3  2016-12-12 Leon Jacobs (tag: 2.0.4) Version Bump
00c3bf2  2016-12-12 Leon Jacobs Grant first time SSO login opportinity to set an email.
aa62453  2016-12-12 Leon Jacobs Return a response instead of a just a view.
```
### 2.0.5
```
ed9901b  2016-12-13 Leon Jacobs (tag: 2.0.5) Version Bump
617670b  2016-12-13 Leon Jacobs Finally, add the favico.
a9f3aa4  2016-12-13 Leon Jacobs Help prevent users from accidently disabling themselves.
786a4ed  2016-12-13 Leon Jacobs Fix eveseat/seat#158 by checking if Email Activation is required.
```
### 2.0.6
```
a00f236  2016-12-15 Leon Jacobs (tag: 2.0.6) Version Bump
4637e88  2016-12-15 Leon Jacobs Style fixes
829b93b  2016-12-15 Loïc LEUILLIOT fix issue related to permission when an object owner get all permission, including system permission. (#54)
e31f19e  2016-12-15 Leon Jacobs Apply threaded view to mail timeline
9532c87  2016-12-15 Leon Jacobs Code style and formatting fixes.
8b640ba  2016-12-15 Loïc LEUILLIOT Key list search (#56)
df176ba  2016-12-14 Leon Jacobs Add a threaded view to the mail read view.
06fe0ac  2016-12-14 Loïc LEUILLIOT fixing issue introduce on #52 (#55)
799a7b9  2016-12-14 Loïc LEUILLIOT add the ability to search on keyID field from ApiKey (#52)
```
### 2.0.7
```
63adffb  2016-12-16 Leon Jacobs (tag: 2.0.7) Version Bump
d4c6988  2016-12-16 Leon Jacobs Mail characterName clickable.
92bf30b  2016-12-16 Leon Jacobs Make mail view as threads configurable.
915eb64  2016-12-16 Leon Jacobs Ensure require_activation is validated.
40b1263  2016-12-16 Leon Jacobs Allow jobs to be manually killed/removed.
c26f501  2016-12-15 Leon Jacobs Fix typo
99c5c3f  2016-12-15 Leon Jacobs Fix typo
```
### 2.0.8
```
b7ecacd  2016-12-21 Leon Jacobs (tag: 2.0.8) Version Bump
4b7a4af  2016-12-21 Leon Jacobs Give manually submitted update jobs some priority
8740878  2016-12-21 Leon Jacobs Fix bug where new keys wont show in API key list
6d28de8  2016-12-21 Leon Jacobs Fix comment
3ebcf67  2016-12-21 Loïc LEUILLIOT update permission system in order to have a faster discover (#57)
5881ab5  2016-12-21 Leon Jacobs Show if the joblog is disabled.
22cb093  2016-12-21 Leon Jacobs Fix language string
6a01a76  2016-12-21 Leon Jacobs Fix column names
3bca775  2016-12-21 Leon Jacobs Add ability to view joblogs.
02bc02c  2016-12-19 Leon Jacobs Add bz2 as an extention requirement
```
### 2.0.9
```
ba7118d  2016-12-28 Leon Jacobs (tag: 2.0.9) Version Bump
507caf2  2016-12-28 Leon Jacobs Show corporation assets contents
6929851  2016-12-28 Leon Jacobs Update message about job that git pushed to the queue
ec1b412  2016-12-28 Leon Jacobs Hide update button if key is not enabled
d08077f  2016-12-28 Leon Jacobs Check that key info exists before attempting to set it
4ea98ac  2016-12-27 Leon Jacobs Dont consider affiliations for menu item check
e3740e9  2016-12-27 Leon Jacobs Add filter to clean out null menu entries.
30f5826  2016-12-26 Leon Jacobs Update sidebar menu loader to sort menu items alphabetically.
5d1d860  2016-12-26 Leon Jacobs Add corporation contracts view
11e3cb0  2016-12-26 Leon Jacobs Add contract items view for characters
fa511ba  2016-12-26 Leon Jacobs Code style tweaks and color tweaks for asset contents view.
eb4c37b  2016-12-26 freedenizen Web portion of character nested asset view (#58)
```
### 2.0.10
```
46d14d9  2017-01-01 Leon Jacobs (tag: 2.0.10) Version Bump
32be7a5  2017-01-01 Leon Jacobs Rename configuration to settings.
```
### 2.0.11
```
0b890f6  2017-01-12 Leon Jacobs (tag: 2.0.11) Version Bump
aa88df0  2017-01-12 Leon Jacobs Fix eveseat/seat#173 by adding a unique constriant to emails
183389f  2017-01-12 freedenizen Characterassets update (#60)
a3c4d52  2017-01-06 Leon Jacobs Update ms to s
aab1aae  2017-01-04 Leon Jacobs Improve readability
0e92e5e  2017-01-04 Leon Jacobs Update styleci config
45dd47f  2017-01-04 Leon Jacobs Fix eveseat/seat#171 by using `Laravel\Socialite\Two\InvalidStateException`
cf5c8e0  2017-01-02 Leon Jacobs Apply fixes from StyleCI (#59)
5ad0d85  2017-01-02 Leon Jacobs Add StyleCI configuration & badge
ae5b3b2  2017-01-01 Leon Jacobs Style fixes
```
### 2.0.12
```
052ab31  2017-01-22 Leon Jacobs (tag: 2.0.12) Version Bump
b3c3cf3  2017-01-22 Leon Jacobs Apply fixes from StyleCI (#62)
be689d2  2017-01-22 Leon Jacobs Load assets contents using ajax requests
666d353  2017-01-22 Leon Jacobs Include the original title and sent date when parsed headers arent ok
5692799  2017-01-22 Leon Jacobs Improve 'inverse' tag on permissions and affiliations
ab28861  2017-01-22 Leon Jacobs Fix eveseat/seat#181 by ensuring that permission inverses are checked
c3fa810  2017-01-22 Loïc LEUILLIOT Fix ACL issue on menu display if menu is requiring permission affiliation (#61)
b669fbb  2017-01-20 Leon Jacobs Add codeclimate configuration
```
### 2.0.13
```
6adfb30  2017-02-19 Leon Jacobs (tag: 2.0.13) Version Bump
a179b5e  2017-02-19 BenH    improved lisibility on the skill sheet of a character (#69)
fe3fac6  2017-02-19 Leon Jacobs Show status of job logging
76f4e27  2017-02-19 Leon Jacobs Add space
a95747d  2017-02-19 Loïc LEUILLIOT Use font-awesome package instead raw import in order to get always last provided icons (#68)
d7bd1fd  2017-02-10 Loïc LEUILLIOT Add a third menu level into sidebar (#66)
b1b685c  2017-02-10 BenH    Improved Tools>People Groups layout (#65)
deaec02  2017-02-02 Leon Jacobs Add comments
4f5af78  2017-02-02 BenHUET Allow to add custom content from a child template to <head> (#64)
```
### 2.0.14
```
0f9e10d  2017-04-17 Leon Jacobs (tag: 2.0.14) Version Bump
dd9fddd  2017-04-17 Leon Jacobs Apply fixes from StyleCI (#78)
c90f111  2017-04-17 Leon Jacobs Simplify the character_id and corporation_id lookups.
763684a  2017-04-17 Loïc LEUILLIOT fix acl minor issue related to job dashboard access from header buttons (#77)
6916be3  2017-04-17 Leon Jacobs Remove wildcard checks as this is done with `hasSuperUser`.
36247bf  2017-02-19 moe-alabel Modified cron statements to proper format. Changed from 6 positions to 5 (#70)
```
### 2.0.15
```
c6ee343  2017-07-02 Leon Jacobs (tag: 2.0.15) Version Bump
758cb4c  2017-07-02 Viola   add language Chinese (#79)
c66c132  2017-06-30 Loïc LEUILLIOT the current delete statement is not firing the delete event from eloquent (#81)
```
### 2.0.16
```
66edf32  2017-08-12 Leon Jacobs (tag: 2.0.16) Version bump
fe45072  2017-08-12 Loïc LEUILLIOT add status filters on industry tables for both character and corporation (#82)
68e3c93  2017-08-12 Leon Jacobs Style fixes.
6879b29  2017-08-12 Loïc LEUILLIOT allow SeAT owner to overload theme using two custom css file (#84)
eb367cf  2017-08-12 Loïc LEUILLIOT pugx service is dead, replace all badge by shields.io (#85)
f116ff1  2017-08-12 Leon Jacobs Style fixes.
2391377  2017-08-12 Loïc LEUILLIOT hide enable/disable account status if the instance is not requiring mail activation (#83)
d1b1527  2017-08-12 Loïc LEUILLIOT improve tables usability by adding paginate on both header and footer as well as filter feature (#80)
```
### 2.0.17
```
0450d6c  2017-08-12 Leon Jacobs (tag: 2.0.17) Version bump
ac49aa9  2017-08-12 Loïc LEUILLIOT fix merge issue due to conflicting dom property between indie filter PR and paginate duplication PR (#86)
```
### 2.0.18
```
036bce9  2017-09-17 Leon Jacobs (tag: 2.0.18) Version bump
4ab49a2  2017-09-17 Loïc LEUILLIOT fix hasrole method by calling magic property instead method. (#90)
6183416  2017-09-16 Loïc LEUILLIOT add documentation link to supervisor integration (#89)
```
