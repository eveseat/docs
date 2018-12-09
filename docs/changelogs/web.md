![SeAT](http://i.imgur.com/aPPOxSK.png)

# web change logs
Generated with: `git log --pretty=format:%h%x09%x09%s`

### 1.0-pre-alpha
```
6332cd7		Update README
a48340a		Login using names instead of emails
2dfdc27		Add ability to view corp wallet transactions
06c4741		Add ability to view corp wallet journals
97547a7		Add ability to view corp standings
1a825e0		Add ability to view corp market orders
bab5d6a		Add ability to view corp killmails
26923cc		Add ability to view corporation industry jobs
fc43803		Add ability to view corporation contracts
a386881		Add ability to view corp contacts
110b142		Add ability to view corporation assets
2b9dd85		Add ability to view corp summary
0bf5bdc		First work on corporation views.
5114d4f		Resolve a trait method conflict
5eaffdc		Add ability to mass import keys via CSV files
17feb08		Add ability to view character standings
797c9f0		Add ability to view character research info
771ee34		Add ability to view character PI
0fcb7de		Add ability to view character market orders
a6b7ac6		Add ability to view character industry
c020c36		Small UI refactor to make it cleaner
0d5e18a		Add character contract view
f36e34b		Add ability to view character killmails
45e8dd5		Link to character details
08d1d48		Add character contacts view
dc3a396		Add character calendar view
085368f		Add character notifications view
04ca0ee		Add filter rules.
ccc5ad2		Add Character Assets View
c748d29		Add table-responsive
9aaa7ae		Add Character Mail View
f046272		Add Character Wallet Transaction View
1ae69e0		Add Character Wallet Journal View
814a95d		Rename method from EveRepository
5d9cfc1		Add Implants, Jump Fatigue and Clone info
ac83d39		Minor formatting changes
3631b89		Re-arrange character details layout
e23a153		Add more character sheet info and shuffle a few things around
c414bb2		Create a base view for character detail views
d3fc448		Add Character Skills view
51caf72		Add Security logging and viewing abilities
7debd56		Start the Character Viewer
5bfbed0		Small responsive fixes
4cf03ed		Add All Characters View
51ccf46		Add hasAny()
12e05de		Split permissions into categories
50a68ab		Add a view into the Job Queue as well as some management
0da342b		Add live queue status updates
b9df4c4		Fix cases where keys with missing info would throw errors
9faffab		Remove usage of the Redirect Facade
2250508		Add ability to manually start a job update
3e34b3e		Add key detail viewer and introduce the keybouncer
85bf567		Add ability ti list and delete API keys
2fe3d76		Add lazy image loading support
ee21c49		Style fixes
1de991a		Add ability to add new Api Keys
358ba7f		Make sidebar permissions aware
41190e6		Introduce the Bouncer and hes Clipboard 🚪
c2edc6b		Use auth() helper instead of Auth Facade
2a864dc		Fix some inconsistency with edit/updater user lang
e473bba		Swap input for has to read better
5e65509		Allow for users to be quick added
89ca4e1		Allow for the account status to be filled
05e6019		Resize grid to match other configuration views
fdeb2cc		Rename menu entry to match page title
7a03e34		Complete the impersonation feature
6195979		Add ability to delete users
0675ef9		Cleanup when a user is deleted
4c58659		Allow for users to be modified
a3f1882		Add a basic summary of user roles and affiliations
f03f872		Localize flash messages on perm/role changes
679b020		Fix typo in affiliation form request validator
2e656a8		First iteration of Acl methods and web structuring.
e8c4343		Highlight submenu items based on URL match
b6cd2b9		Have the sidebar honor the Locale
1f91ef0		Add view composer to build the sidebar menu
3425769		Add a User view composer
3e72326		Restructure Service Provider
4aa96f5		Fix duplicate 'reset' translation key
1160deb		Use class property
22c7747		Add password reset functionality
9377f67		Add README
f16a71d		Start web interface
3f15794		Initial commit
```
### 1.0.0
```
e885f07		Style fixes and version Bump
fddc5ba		Add SeAT Settings Page with registration toggle
30b2b9c		Add more settings options
bb6e8ed		Add ability to change SeAT theme.
8dbb713		Read skin ccs filename from settings()
67d823c		Read some values from settings
91872a1		Remove unused HTML and fix brand route
3ec66f3		Reduce icon size and add corp icons
e78c62f		Add more complete corp security views
13f6c9d		Add ability to view corp member tracking
```
### 1.0.1
```
4598815		Version Bump
2c683ba		Dont force a package to have a sub-menu
6c13e32		Resolve menu routes in the sidebar view.
e8f3237		Add api version display
0f6d4ec		First pass in allowing packages to add menu items
fe117ce		Add hasRole() method
be056a9		Fix #2
```
### 1.0.2
```
7fcac57		Version Bump
020c885		Add notifications version
f9fdaf6		Dont force packages to set a permission
5d1bb8c		Add email notifications setting and new email templates
4bade0d		Auto update copyright year
9eba303		Add WebUI to manage schedules
```
### 1.0.3
```
bc8e6eb		Start something for a dashboard
0238e32		Update README.md
73d415d		Add optional Google Two-Factor TOTP support.
84723ff		Merge pull request #3 from Cynabal/patch-1
2d98ead		Update add.blade.php
```
### 1.0.4
```
4aab9b8		Version Bump
```
### 1.0.5
```
df6ddae		Version Bump
14bc397		Add ability to set an admin contact
5e6498b		Add links to external services
f819124		Show output of jobs
070c232		Show eveapi errors status
80775e2		Allows superusers to transfer keys to other owners
```
### 1.0.6
```
2042098		Version Bump
83a7ea8		Add Afrikaans language support
0039045		Add ability to select a preferred language
30a71e6		Update langauge strings
2956a15		Resolve contract issuerID's to names
36ea925		Apply number() to a few values
40e5c24		Add ability to view profile login/logout history
a8e93d7		Add for user password resets
81682c4		Add recipient info into the mail timeline
cc141c8		Add id-to-name helper
6999007		Add X-CSRF Token for ajax calls
6915fec		Add the mail timeline view
5ade565		Add ability to view character email
```
### 1.0.7
```
660b6fa		Version Bump
b65aa7e		Remove URI scheme
639b3fb		Add missing language definition for view
```
### 1.0.8
```
0ece0ce		Version Bump
616067c		Check if we have data before attempting to display
99c14a3		Fix eveseat/seat#10
```
### 1.0.9
```
9e4cd79		Add account info check and Version Bump
bfaabe2		Merge pull request #4 from freedenizen/master
d802b98		add updated_at timestamps to Character and Corporation Sheet summary
```
### 1.0.10
```
5aebf1e		Allow French to be chosen and Version Bump
dae1719		Merge pull request #5 from warlof/french
6e827ae		Translate SeAT in french according to 1.0.9
```
### 1.0.11
```
ca67d0a		Version Bump
78da260		Add ability to view corporation bookmarks
eda1260		Add ability to view character bookmarks
8e1285e		Add ability to view character channels
```
### 1.0.12
```
7bdbf10		Version Bump
6c365ad		Specify versions with ~
3f604e2		Merge pull request #11 from warlof/french
c1f4657		add new translations according to recent commits (for 1.0.12)
ed485b3		Move strontium usage to its own string for easier translation
64a6f86		Take into account bonusses silo/coupling array capacities
488fd3b		Merge pull request #8 from warlof/unknown-item
cd66a8a		Add Starbase details views
f9dc521		fix issue #9
9f74d1c		Add more details about starbases
7e67371		First pass at adding starbase views
9496188		Merge pull request #6 from warlof/french
2491e69		Translate SeAT in french according to 1.0.11
f5fa4e3		Show timestampts and paginate wallet info
c6b4311		Fix eveseat/seat#15
```
### 1.0.13
```
936e8b8		Fix a assets check, add missing string and Version Bump
```
### 1.0.14
```
3f8587c		Version Bump
14d87b4		Merge pull request #13 from warlof/ticket5
d412b7e		Excluse Towers themselves from module views
98a8e19		Use a macro for progressbar generation
c0e9ce3		Remove unused variables
22932b4		Refactor Starbase views mostly for performance reasons
0cefaac		fix issue #5 about labels display on neutral and negative standing
```
### 1.0.15
```
bbede7b		Version Bump
63f308a		Load starbase modules via Ajax calls
c0f48df		Display page render time
```
### 1.0.16
```
075784c		Version Bump
b688c4f		Add planet type icons
54ccdec		Add corporation Pocos view
```
### 1.0.17
```
ec9d5c8		Version Bump
aaaac36		Fix eveseat/seat#29
6de7e1e		Add Datatables for tables.
```
### 1.0.18
```
69239bf		Version Bump
33470ce		Allow packages to hook into corporation menus
24c9f1d		Only attempt to read package menus if they are defined
3b7ecad		Allow packages to hook into character menus
bac4a6e		Add Datatables to starbase summary
```
### 1.0.19
```
f212c78		Version Bump
d5376f9		Update Copyright
39c8243		Subclass the bouncers
afb0be5		Add a People Groups feature
17c4f3e		Set queue status update time via configuration
5d30ff0		Fix eveseat/seat#48 by adding data-order attributes
530c268		Add a check for loaded modules and php version
c84baaa		Merge pull request #18 from warlof/ticket38
e4e1fd0		Merge pull request #20 from warlof/ticket43
94e470d		Fix wishlist #38 eveseat/seat#38
21a3bb3		Fix issue eveseat/seat issues#43 - Update calc formula - Adding ceil in order to get round item unit (ccp like)
274409b		Use league/csv to parse CSV's instead of the homebrew
741755d		Remove unnecessary re-fetch of model data
b7ff1a2		Fix eveseat/seat#39 by changing ownership of an existing key.
8fcc13e		Remove footer. Datatables will count the keys
b357826		Code formatting fixes
d5f58de		Merge pull request #19 from Cynabal/master
7a78e2f		Merge pull request #17 from warlof/french
9d2ab0f		Update seat.php
86da25f		New translation according to v1.0.18
```
### 1.0.20
```
e2056a1		Version Bump
92986b7		Remove pcntl requirement
ad5f515		Merge pull request #21 from warlof/french
642a832		New french translation according to 1.0.19
```
### 1.0.21
```
70783d8		Version Bump
c9188b7		Fix eveseat/seat#60 by using `firstOrNew` instead of create
98b9679		Fix eveseat/seat#51 by always showing the pagination
```
### 1.0.22
```
cc8019a		Version Bump
0f02f88		Fix eveseat/seat#59 by adding a unique validation constraint
c69fa2f		Add button to easily re-enable keys
```
### 1.0.23
```
954c178		Version Bump
498b868		Fix eveseat/seat#70 by ignoring the current users email in the constraint
8422602		Fix eveseat/seat#57 by adding missing language strings
```
### 1.0.24
```
c20194b		Version Bump
eac101f		CS Fixes
f6e3186		Small refactoring and CS fixes
9997914		Adding Corporation Wallet Ledger (#23)
```
### 1.0.25
```
168bb3e		Version Bump
aee17af		Add ability to force a minimum API access mask.
5101767		Start adding search functionality
b8ac4fb		Remove accountid as it is not useful data
8604036		Fix eveseat/seat#81 by validating for numeric instead of integers
e1cd641		Fix eveseat/seat#78 by adding a link to view one mail only
60727e4		Warn if the default admin contact is still set. Ref eveseat/seat#77
a5d1f8f		Fix eveseat/seat#65 by setting the key_id in the model
9884772		fix reinforcement time using API stateTimeStamp (#24)
```
### 1.0.26
```
981ccc4		Version Bump
0796b2c		Allow SSO to be enabled/disabled via the web interface.
7a605be		Give accounts a temp email address and flag Sso created accounts
6efc9bf		Add first support for the EVE Online SSO
```
### 1.0.27
```
7689032		Version Bump
c036c44		Update Provider with new method name.
```
### 1.0.28
```
4e5225e		Version Bump
5b2443b		FIx indentation
f9b6ee8		Added total values to the Bounty Prizes and PI monthly ledgers. (#25)
21fc0d9		Remove logic that is now in the service repository.
```
### 1.0.29
```
bc76609		Version Bump
12a1229		Resolve names of affiliations.
e1c82e3		Paginate character contracts and all killmails
91a5e98		Fix eveseat/seat#111 by paginating the results
3ac3699		Fix eveseat/seat#121 by adding a button to re-enable all keys
a6a8897		Add warning about a autogenerated email from sso
c66c68e		Fix spacing
4aa702d		Small codestyle related fixes
1cca04d		Provide a way for user to change their email address (#27)
e27d545		Adjusted setting (#26)
```
### 1.0.30
```
bc1f5ac		Version Bump
33b0e03		Update full api mask (#31)
ec19039		Add link to analytics doc
ccd332d		Add ability to disable tracking completely.
c7372e9		Add corporation titles to character sheet
b527652		Add contact tracking links into character and corporation contact list (#30)
```
### 1.0.31
```
9fdea41		Version Bump
8d1f8fd		Formatting and style fixes
360e76c		add SDE version into both footer and settings page (#39)
1db0265		Add alliance name filter to character list
770044c		Fix permission issues (#38)
7c935df		add alliance icon and name into character list. fixes eveseat/seat#134
2ad376f		Rename EveonlineProvider.php to EveOnlineProvider.php (#36)
edb6543		Fix formatting
584c9e6		Add collateral amount into contract list (#33)
433f10a		Fix formatting and restore min_access_mask language string
60b7cd6		Create a new minimum required mask dedicated for corporation (#34)
22c4209		Add paid-until in Key Details view (depends on PR paid-until branch from eveseat/eveapi) (#32)
```
### 2.0.0
```
e648d7e		Version Bump! 2.0.0! ⚡️
690f1be		Format and style fixes.
f7ad9a6		add disable key function (#50)
48069d6		Add a check for cases where api keys may have `null` constraints.
82f1bbb		Move the Validation namespace to Seat\Web\Http\Validation.
55436eb		Allow constraints to be set on specific API keys.
1ab8153		Add message that all workers will run without a constraint set.
d2faf43		First iteration of adding worker constraints.
893f9a9		Formatting and style fixes.
946578d		Change method visibility to private.
f65286c		Small refactoring and code cleanup for the SSO upgrade option.
8583a5c		fix multiple user creation when user is already owning an account and authenticate with SSO (#49)
c2d4cc7		Correctly sort first search results.
0da3bf0		Add character skills and assets search.
fa2a4fd		Remove return type as there is more than one
8892a83		Show security logs using datatables.
bc2b8f2		Convert Search results to use Datatables.
e259c38		Add skills graphs to character skills view.
26bbed0		Move character skills graphing routes the the CharacterController.
29f8614		add skills related chart (#48)
680e4a3		Drop minimum stability, add prefer-stable and bump to 2.0.0-alpha2.
dd76e24		Update composer for 2.0 packages and version 2.0.0-alpha1
a408ddf		Add a character wallet spend graph.
ff13f32		Introduce ChartJS and add more dashboard elements.
21067c6		Allow packages to set a permission required for a menu item.
b82aa7d		Use select2 for character selection
db20434		Set main character ID & name on SSO login
7c4868f		Allow for sub menus to be pluralized
685b96d		Add localization for email verification.
5ea1f72		Remove unessesary file
85ad7de		Add email verification to account creation.
6cc2854		Update EVE API status to match new style.
32641e0		Move supervisor status to a panel.
99ae5b6		Prepare status response from a collection instead of a raw array.
241c9a9		Use process group name from config file.
70bb0ff		Bind 'supervisor' as a singleton into the IoC to remove code clutter.
5b88e1b		Move supervisor config ot its own file.
c40bf89		Move available languages to its own config
d3879ac		Improve queue dashboard by adding supervisor information (#43)
f09384a		Add ability to edit existing notes.
4c30a48		Remove character specific notes model and use services model note trait.
56f316c		First iteration adding notes to the intel section
cf30e2f		Remove intel journal detail
f1f4a17		Allow standings profiles to be built by importing char/corp contacts 👍
0f6c11c		Inject the affected id from the request.
40f2b65		Allow for a standings profile to be deleted.
aed53aa		Move People Groups to the Tools section
a50a741		Remove ajax responses and return json for datatables.
5d55b47		Move the last summaries to datatables
e8813d7		Convert top transactions to datatables view
9b6f2b8		Fix alliance name images
6bb770f		Load mail interactions using datatables.
8712398		Fix typo from `read` to `ready`.
441a612		Sort the character list correctly
debd68e		Do not include the old filter config file
6146dca		Remove state config file of the old `Filterable` trait
5445360		Convert character tables to datatables.
abb48be		Fix Mail menu entry name
94a6c32		Correctly sort by default
f485c03		Include external providers in a seperate method.
fdfd922		Fix indenting
4bae275		Hide registration link if registration is disabled (#46)
7a0cfcb		Fix searching on corporation killboard
4c04af9		Indenting fixes
a5125e3		Add two low fuel warning on starbase list (#45)
de8b88c		Convert Corporation tables to data tables.
34c6bc9		Sort Datatables columns by default on fist column
d13c96f		Allow for name resolution to be called by function
f9b0962		Covert Corporation View to use Datatables
e7bd080		Make datatables responsive by default
09714e0		Use the new data tables helper to make search & sorting work
a5e8cbe		Add a JS version of the `human_readable` helper
51340f8		Add javascript using `push` & format fixes
bcc35e0		Redesign queue dashboard to use a dynamic table (#41)
142bb8a		Add scripts using a `stack` instead of `section`.
a99aeb6		Add yajra/laravel-datatables and convert api key list to datatables
e7d8e07		Start the intel journal detail view.
6dd6312		First rough commit of character intel module! 👾
d7aa864		Formatting fixes
3369f0b		Add ability to mark label as a plural
6dcb3de		refactoring a bit menu composer in order to define a menu composer type and use config file instead hard coded entry (#44)
ea656b5		Code formatting fixes.
869e26c		Explode the Corporation\ViewController into seperate controllers
e19b350		Paginate market orders
0933c79		Explode Character\ViewController into better managed controllers
b5e6f9f		Extend new core controllers instead of base in App namespace
1890f8a		Redirect to the newly created role
e38c7ba		Add ability to wildcard corporation and character access
5d8ccca		Simply validation using form array validation.
231ea86		Remove `insteadof` as repository refactor removed the need for this
ce1bd67		Change Action to route home
f6fb5f9		Fix translation strings
27bd2c2		Implement Inverse access checking
48160d5		Rename Pillow to AccessManager and add typing
7042418		Fix translation key
896592c		Add support for storing inverse permissions
86ade0b		Add the AuthorizationController and fix the KeyBouncer
d8a412f		Update bouncers to return a redirect instead of view
2d73c70		Update to match new class names in eveapi repo
249c5af		Fix language string
038ba4d		Update to make use of new Corp repository classes
fb129f9		Update to make use of new Character repository classes
799fdee		Update distrib JS/CSS
74752d2		Upgrade to AdminLTE 2.3.7
735279c		Remove usages of `collect()`. All queries return a collection by default
ee461fb		Upgrade `pragmarx/google2fa` & `league/csv` dependencies
e414ecb		Updpate Form Request validation to extend new base class
fe0606d		Show icon of actual ship instead of a generic one
e4821ca		fix paid-until issue in detail api key view due to possible missing status (#40)
2bef52c		Move logout to a POST method as the new Laravel default
abea1b1		Rename `lists()` to `pluck()`
c215f78		Update Authentication Scaffolding for Laravel 5.3
97fdc4d		Add Notifiable trait introduced in L5.3
6366ccc		Update Events to use new Class based events for L5.3
c45ac15		Update composer to require PHP7 and Laravel 5.3
```
### 2.0.0-alpha1
```

```
### 2.0.0-alpha2
```
680e4a3		Drop minimum stability, add prefer-stable and bump to 2.0.0-alpha2.
```
### 2.0.1
```
00536d7		Version Bump
41cc905		Remove trailing brace
b8ed06b		Only display graphs when there is data.
14c547e		Small layout refactor and removal of self account deletion.
d07639f		Log impersonation events.
158b141		Improve impersonation by adding an easy revert option.
5f8ea64		Allow sorting by key status and show disabled reason in details.
986541c		Fix global worker constraints view.
536880c		Update datatables version constraint as newer versions are broken.
edb4f27		Fix eveseat/seat#152 by instantiating with `moment.utc`.
e648d7e		Version Bump! 2.0.0! ⚡️
690f1be		Format and style fixes.
f7ad9a6		add disable key function (#50)
48069d6		Add a check for cases where api keys may have `null` constraints.
82f1bbb		Move the Validation namespace to Seat\Web\Http\Validation.
55436eb		Allow constraints to be set on specific API keys.
1ab8153		Add message that all workers will run without a constraint set.
d2faf43		First iteration of adding worker constraints.
893f9a9		Formatting and style fixes.
946578d		Change method visibility to private.
f65286c		Small refactoring and code cleanup for the SSO upgrade option.
8583a5c		fix multiple user creation when user is already owning an account and authenticate with SSO (#49)
c2d4cc7		Correctly sort first search results.
0da3bf0		Add character skills and assets search.
fa2a4fd		Remove return type as there is more than one
8892a83		Show security logs using datatables.
bc2b8f2		Convert Search results to use Datatables.
e259c38		Add skills graphs to character skills view.
26bbed0		Move character skills graphing routes the the CharacterController.
29f8614		add skills related chart (#48)
```
### 2.0.2
```
e7590c3		Version Bump
7d00d54		Limit keys returned based on permissions
```
### 2.0.3
```
e960118		Version Bump
d30202a		Update view to check new key status field
3f826f8		Add option to disable email activation requirement.
a388a5d		Use `setting()` helper instead of static Class method
55cfca3		fixing possible issue with Supervisor Monitor setting (#51)
```
### 2.0.4
```
3d2f6b3		Version Bump
00c3bf2		Grant first time SSO login opportinity to set an email.
aa62453		Return a response instead of a just a view.
```
### 2.0.5
```
ed9901b		Version Bump
617670b		Finally, add the favico.
a9f3aa4		Help prevent users from accidently disabling themselves.
786a4ed		Fix eveseat/seat#158 by checking if Email Activation is required.
```
### 2.0.6
```
a00f236		Version Bump
4637e88		Style fixes
829b93b		fix issue related to permission when an object owner get all permission, including system permission. (#54)
e31f19e		Apply threaded view to mail timeline
9532c87		Code style and formatting fixes.
8b640ba		Key list search (#56)
df176ba		Add a threaded view to the mail read view.
06fe0ac		fixing issue introduce on #52 (#55)
799a7b9		add the ability to search on keyID field from ApiKey (#52)
```
### 2.0.7
```
63adffb		Version Bump
d4c6988		Mail characterName clickable.
92bf30b		Make mail view as threads configurable.
915eb64		Ensure require_activation is validated.
40b1263		Allow jobs to be manually killed/removed.
c26f501		Fix typo
99c5c3f		Fix typo
```
### 2.0.8
```
b7ecacd		Version Bump
4b7a4af		Give manually submitted update jobs some priority
8740878		Fix bug where new keys wont show in API key list
6d28de8		Fix comment
3ebcf67		update permission system in order to have a faster discover (#57)
5881ab5		Show if the joblog is disabled.
22cb093		Fix language string
6a01a76		Fix column names
3bca775		Add ability to view joblogs.
02bc02c		Add bz2 as an extention requirement
```
### 2.0.9
```
ba7118d		Version Bump
507caf2		Show corporation assets contents
6929851		Update message about job that git pushed to the queue
ec1b412		Hide update button if key is not enabled
d08077f		Check that key info exists before attempting to set it
4ea98ac		Dont consider affiliations for menu item check
e3740e9		Add filter to clean out null menu entries.
30f5826		Update sidebar menu loader to sort menu items alphabetically.
5d1d860		Add corporation contracts view
11e3cb0		Add contract items view for characters
fa511ba		Code style tweaks and color tweaks for asset contents view.
eb4c37b		Web portion of character nested asset view (#58)
```
### 2.0.10
```
46d14d9		Version Bump
32be7a5		Rename configuration to settings.
```
### 2.0.11
```
0b890f6		Version Bump
aa88df0		Fix eveseat/seat#173 by adding a unique constriant to emails
183389f		Characterassets update (#60)
a3c4d52		Update ms to s
aab1aae		Improve readability
0e92e5e		Update styleci config
45dd47f		Fix eveseat/seat#171 by using `Laravel\Socialite\Two\InvalidStateException`
cf5c8e0		Apply fixes from StyleCI (#59)
5ad0d85		Add StyleCI configuration & badge
ae5b3b2		Style fixes
```
### 2.0.12
```
052ab31		Version Bump
b3c3cf3		Apply fixes from StyleCI (#62)
be689d2		Load assets contents using ajax requests
666d353		Include the original title and sent date when parsed headers arent ok
5692799		Improve 'inverse' tag on permissions and affiliations
ab28861		Fix eveseat/seat#181 by ensuring that permission inverses are checked
c3fa810		Fix ACL issue on menu display if menu is requiring permission affiliation (#61)
b669fbb		Add codeclimate configuration
```
### 2.0.13
```
6adfb30		Version Bump
a179b5e		improved lisibility on the skill sheet of a character (#69)
fe3fac6		Show status of job logging
76f4e27		Add space
a95747d		Use font-awesome package instead raw import in order to get always last provided icons (#68)
d7bd1fd		Add a third menu level into sidebar (#66)
b1b685c		Improved Tools>People Groups layout (#65)
deaec02		Add comments
4f5af78		Allow to add custom content from a child template to <head> (#64)
```
### 2.0.14
```
0f9e10d		Version Bump
dd9fddd		Apply fixes from StyleCI (#78)
c90f111		Simplify the character_id and corporation_id lookups.
763684a		fix acl minor issue related to job dashboard access from header buttons (#77)
6916be3		Remove wildcard checks as this is done with `hasSuperUser`.
36247bf		Modified cron statements to proper format. Changed from 6 positions to 5 (#70)
```
### 2.0.15
```
c6ee343		Version Bump
758cb4c		add language Chinese (#79)
c66c132		the current delete statement is not firing the delete event from eloquent (#81)
```
### 2.0.16
```
66edf32		Version bump
fe45072		add status filters on industry tables for both character and corporation (#82)
68e3c93		Style fixes.
6879b29		allow SeAT owner to overload theme using two custom css file (#84)
eb367cf		pugx service is dead, replace all badge by shields.io (#85)
f116ff1		Style fixes.
2391377		hide enable/disable account status if the instance is not requiring mail activation (#83)
d1b1527		improve tables usability by adding paginate on both header and footer as well as filter feature (#80)
```
### 2.0.17
```
0450d6c		Version bump
ac49aa9		fix merge issue due to conflicting dom property between indie filter PR and paginate duplication PR (#86)
```
### 2.0.18
```
036bce9		Version bump
4ab49a2		fix hasrole method by calling magic property instead method. (#90)
6183416		add documentation link to supervisor integration (#89)
```
### 2.0.19
```
7ea9e99		Version Bump.
58a04ad		Apply fixes from StyleCI (#94)
1abb402		Fix 'disabled account' behaviour.
9aaa93d		Revert "security hotfix which is providing a control on disabled account (#92)" (#93)
7c72e63		security hotfix which is providing a control on disabled account (#92)
8a1e143		Formatting fixes.
262cf96		security hotfix : add missing ACL from people and group feature (#91)
```
### 3.0.0
```
13f20a7		v3.0.0 🎉
6e1b466		Show email address in user list.
13d8183		fix skill training human conversion (#183)
27d29a4		Fix character standings view.
11e5ff2		Paginate standings view.
cdbf668		Remove mcrypt dependency for PHP 7.2 support.
736375d		Add more character manual update dispatchers.
23ec965		Remove old supervisor integration config.
7a64386		Rename key to token.
bb5dacc		fix starbase layout (progress and offline timer) (#182)
de1c76f		v3.0.0-beta22
2f95358		Include user count.
2dfe458		Refactor user / group listing, again.
0171c24		Remove unused variable and add refactor warning.
30f722b		Fix user layout (#181)
0957696		v3.0.0-beta21
b4a90be		Remove debug code.
736e9bd		Update user list to show groups.
810cabc		Update token deletes as it now has soft deletes.
85bfd44		Update chinese language file (#180)
25aff8d		fix column name according to ESI design (#179)
f6cd5aa		v3.0.0-beta20
4091f3f		Add view to see character fittings.
816dfa9		Cleanup orphan groups when deleting / re-assigning users.
a06d226		v3.0.0-beta19
795a49a		Handle an empty ESI statys gracefully.
eab5e0d		v3.0.0-beta18
70d8269		Apply fixes from StyleCI (#175)
61e9e4e		Add ability to delete characters & corporations via the Web UI.
2623e24		Update wording.
34c3ab0		Add stale data cleanup setting for maintenance job.
593e74e		Apply fixes from StyleCI (#174)
767cb57		Expose ESI status to the WEB UI.
b45daae		append counter on tracking footer (#173)
5ae4303		v3.0.0-beta17
e371c6d		Fix settings relationship.
cc500cc		v3.0.0-beta16
a76eca1		Return MainCharacter of Group (#171)
ba1abce		v3.0.0-beta15
6c0e93f		Allow for user group reassignment.
843a941		Add character attributes.
6f6d340		Add corporation structures view.
3392e1a		Specify the horizon job timeout.
b925e7f		v3.0.0-beta14
3c43088		remove ability to bind admin user to EVE (#170)
abbc9e9		provide extra helper attribute to Group (#169)
632493b		fix sorting on user table for refresh token and last login columns (#168)
b97ddbf		v3.0.0-beta13
3d7f305		Make user listing table responsive.
015fcc6		Reshuffle the dashboard widgets.
910e4d9		Link the email attribute to the User model.
106cd46		Replace character switcher with modal to handle large groups.
f0899dc		Apply fixes from StyleCI (#167)
880eaa7		Move main char and email to a setting for a group.
07a18b4		updated missing fields in web app manifest (#166)
fb93023		v3.0.0-beta12
6e4887b		Update links for eveboard to eveskillboard (#165)
cdfbccf		Update log.blade.php (#164)
4cbd395		fix: The characters ship will now get displayed properly. (#163)
f68bb58		eveseat/seat#310: Fixes broken login via admin link (#162)
5be4077		v3.0.0-beta11
f55e850		Handle a case where worker counts cant be set without the DB.
45e77ce		v3.0.0-beta10
f7b88fe		[WIP] Allow jobs to be manually and contextually dispatched.
bb05dd6		Dispatch update jobs with high priority on login.
491cdcb		Add ability to configure worker count with the web UI.
cdc5b71		Fix for offline POS (#161)
9189b1a		Remove some defunct services.
8a34135		Fix starbase views when tower has no fuel.
08b7251		Handle message bodies that may not yet have downloaded.
20d2893		Fix stortium checks if no strontium is present.
0dfe14d		Fix type lookups in case its unknown from the SDE.
402f007		fix: Roleconfiguration template tried to access removed property (#159)
118b44c		Fix indentation.
b3ced55		filtering displayed skills and wallet information according to permission on character sheet layout (#160)
d84d83b		v3.0.0-beta9
996a83e		Fix corpacl issue (#158)
d1abdc5		fix doc link to the new amazing documentation ♥ (#155)
4e1f48b		v3.0.0-beta8
d3ebc52		more fix on user layout related to group relationship (#157)
70310b2		fix skill queue refresh according to finished date instead of queue position (#156)
a1d3e2f		fix group attached tokens (#154)
333c195		do not display skills charts for admin user (#153)
a1ac94d		v3.0.0-beta7
28b0bab		fix summary group display and rollback to repository instead model (#152)
523632c		fix route and user/group relationships on user layouts (#151)
c67e679		Fix layouts (#150)
1948ff1		v3.0.0-beta6
270bcf3		Loadbalancing help (#149)
94f43d7		v3.0.0-beta5
57e65d3		Minor styling fixes.
d0fe1f1		Aclchecker fix (#148)
f7b3e33		Removei temporary trusted proxy override.
7302a19		Fix wallet filtering.
2cec3e4		Fix character_id reference.
8dc06cc		Corp taxes (#146)
26e61f6		Apply fixes from StyleCI (#145)
9570831		Update ACL manager to be groups aware.
73df305		Update fillable array for groups.
8d7cfa6		Remove unused imports.
52bd000		Refactor User <-> Group relationships.
c1c86fa		Check that a user is logged in first.
e18a487		Warn if SSO has not been configured yet.
5791051		Remove unused registration logic.
cc39700		Improve user cleanup on delete.
7b44abf		address eveseat/seat#277 (#144)
9527b02		v3.0.0-beta4
7f2bb25		fix character route including initial route parameters (#142)
efdb989		Formatting fixes.
9972fd0		Extend PI View with Extractors (#141)
8a2767d		Fix tax rate and membercount display.
653e05d		Update corporation information on login too.
cad5173		Remove API and Import routes.
c4681fb		Make section linking to third party app access more visible.
4087e7e		3.0.0-beta3
4ba46d2		Add missing SecLog import.
5dc4a28		v3.0.0-beta2
cfb1fda		Package upgrade, autodiscovery and v3.0.0-beta1 tag.
507485a		Remove legacy accessmask setting
7eb435e		Apply fixes from StyleCI (#140)
2d411a9		Indentation fixes.
53d56c9		Minor JavaScript, spelling and other annotation fixes.
26fad1b		state field has been dropped from endpoint (#139)
05070a2		Formatting and style fixes.
6c5afaf		integration eveseat-mining-ledger (#137)
a6bc5b0		Fix corp wallet journal tooltips and job counter ajax.
7584cdb		Fix type_id reference for nested assets content images.
b5bdd3b		Resolve asset hangar division names.
aa9b15f		Update Corporation assets view.
a832b61		Fix dashboard to once again show server status.
ee64a59		Provide visual aids for accounts with invalid tokens.
5db105d		Fix tooltips for killmails.
b872439		Fix tooltips.
5db2b9d		Add link to EVEO third party apps list.
800a376		Prevent accidental removal of roles from yourself.
8ce2ffb		pruning chat channel system according to CCP state (#138)
a645387		upgrade corporation contact in order to implement labels (#136)
26cf741		only grant access to a corporation with wildcard permission if corporation match ! (#135)
9c8da61		Mark new accounts as active by default.
175954d		Only process corporation roles if they exist.
8201497		Grant the `corporation.summary` role with all ingame roles.
ef07072		Grant SeAT roles based on in-game roles.
84bdd59		Improve validation.
9062385		Restore ability to toggle account status.
5e621f2		Fix online players graph.
8bdc529		Fix impersonation session data handling.
6623b0a		Apply vendor published overrides for proxies.
cf506c1		Update standings builder with Laravel 5.5 validation rule changes.
fb09828		update setting validation and drop xAPI related fields (#133)
a3c40de		update intel layouts for ESI (#132)
fd3a3e2		Apply fixes from StyleCI (#130)
5e22915		Fix profile controller view in case no scopes are available.
7a3b0cb		fix burger menu issue related to adminLTE upgrade (#129)
664b441		upgrade standing builder to ESI (#124)
3434323		improve vanilla ACL in order to allow corporation affiliation on char (#122)
0d08acc		allow route bridging between linked characters (#123)
00374a6		Remove the user quick add feature.
e29f8f0		Refactor Register event to instead dispatch update on every login.
9cf7d84		 Pull data for newly created users (#128)
7abbe2b		Align assets representation to ingame experience (#127)
a8938a9		fix employment history sort (#126)
0bd0eeb		Issue254 (#125)
6a16212		fix a typo issue which avoid summary to load on character views (#121)
b314d17		cascading email update over all linked account (#120)
5960947		Prune worker constraint and update adminLTE (#119)
8c49d03		Remove people groups. This will be replaced later.
df48765		Use current user context when getting other users in the group.
a607545		don't use lazy load which is not loading images (#118)
634c831		Fix up Corporation security views with new ESI models.
2893e42		Mograte market view to ESI model data.
e44aae3		Update corporation contacts with ESI data.
d113819		Update validation to pass for a space character since TrimStrings.
36cd185		Add associatedCharacterIds helper.
5c391c3		Update mail timeline with new ESI fields.
1156e79		Remove email warning.
4e1d77c		Fix up Access Control CRUD to match 3.x models.
420ed20		Fix up div allignment for inverse checkbox.
6866c58		Allow inverse to not be required.
df72a5a		Add link to third party app management page.
ba4cda7		Add ability for a user to see granted scopes.
fb82eae		Remove unused settings.
0fc3554		Make Sso scopes configurable to admins.
9a27d76		Corporation 3.x (#117)
802adf0		Corporation 3.x (#115)
ed5608e		Remove supervisor dependency as we are now using Horizon.
bb7e416		upgrade character contracts to ESI models (#114)
96621b3		Fix typo.
7f4223f		Resolve names for wallet journals and transactions.
7898a95		Prevent random crap in the UI from changing to #System.
1f40593		Update access checker to get characters from character_groups.
34fd4dc		Flatten array of ids to resolve.
4bc5670		Remove the count() and process ids that remain.
538b99d		Refactor and modernize the name resolution helper.
78cd00c		Fix character list view and minor refactorings.
f7c5998		Fix group -> user relationship.
52f980a		Migrate Character view to match new ESI models. (#113)
0094101		Formatting and security fixes.
cda9b54		Provide a nice character switcher for user (#97)
0f6a54d		Simplify group syncing when linking characters.
5e7f3fd		Add a property alias for character_id on a User.
b20f1d8		Handle character logins that have a changed character_owner_hash.
1173954		Remove MFA requirement from SeAT. SSO provides this for EVE.
4d9d008		Add ability to see and link new characters.
5487630		Fix profile view and remove password reset feature.
d7549fe		Fix group inheritence for existing sessions.
6e89bc2		Do *not* make id fillable.
26b78fe		[wip] SSO login flow updates for character linking.
0d88bc0		Include recent error count in queue summaries.
4576bbd		Replace queue dashboard with Horizon.
2c75661		Remove references and logic to XML API keys.
174f70f		Record access tokens and expiry on SSO login.
1519a4a		[WIP] Update SSO login to populate refresh tokens and scopes.
ca565d5		[WIP] Minor login page tweaks for SSO button.
d47aa0b		[WIP] Migrate web package to be SSO logins only.
23231a0		Update middleware registers for Laravel 5.5.
b460d6c		Backport path from eveseat/web#90
```
### 3.0.0-beta1
```

```
### 3.0.0-beta2
```
5dc4a28		v3.0.0-beta2
```
### 3.0.0-beta3
```
4087e7e		3.0.0-beta3
4ba46d2		Add missing SecLog import.
```
### 3.0.0-beta4
```
9527b02		v3.0.0-beta4
7f2bb25		fix character route including initial route parameters (#142)
efdb989		Formatting fixes.
9972fd0		Extend PI View with Extractors (#141)
8a2767d		Fix tax rate and membercount display.
653e05d		Update corporation information on login too.
cad5173		Remove API and Import routes.
c4681fb		Make section linking to third party app access more visible.
```
### 3.0.0-beta5
```
270bcf3		Loadbalancing help (#149)
94f43d7		v3.0.0-beta5
57e65d3		Minor styling fixes.
d0fe1f1		Aclchecker fix (#148)
f7b3e33		Removei temporary trusted proxy override.
7302a19		Fix wallet filtering.
2cec3e4		Fix character_id reference.
8dc06cc		Corp taxes (#146)
26e61f6		Apply fixes from StyleCI (#145)
9570831		Update ACL manager to be groups aware.
73df305		Update fillable array for groups.
8d7cfa6		Remove unused imports.
52bd000		Refactor User <-> Group relationships.
c1c86fa		Check that a user is logged in first.
e18a487		Warn if SSO has not been configured yet.
5791051		Remove unused registration logic.
cc39700		Improve user cleanup on delete.
7b44abf		address eveseat/seat#277 (#144)
```
### 3.0.0-beta6
```
1948ff1		v3.0.0-beta6
```
### 3.0.0-beta7
```
a1ac94d		v3.0.0-beta7
28b0bab		fix summary group display and rollback to repository instead model (#152)
523632c		fix route and user/group relationships on user layouts (#151)
c67e679		Fix layouts (#150)
```
### 3.0.0-beta8
```
4e1f48b		v3.0.0-beta8
d3ebc52		more fix on user layout related to group relationship (#157)
70310b2		fix skill queue refresh according to finished date instead of queue position (#156)
a1d3e2f		fix group attached tokens (#154)
333c195		do not display skills charts for admin user (#153)
```
### 3.0.0-beta9
```
d84d83b		v3.0.0-beta9
996a83e		Fix corpacl issue (#158)
d1abdc5		fix doc link to the new amazing documentation ♥ (#155)
```
### 3.0.0-beta10
```
45e77ce		v3.0.0-beta10
f7b88fe		[WIP] Allow jobs to be manually and contextually dispatched.
bb05dd6		Dispatch update jobs with high priority on login.
491cdcb		Add ability to configure worker count with the web UI.
cdc5b71		Fix for offline POS (#161)
9189b1a		Remove some defunct services.
8a34135		Fix starbase views when tower has no fuel.
08b7251		Handle message bodies that may not yet have downloaded.
20d2893		Fix stortium checks if no strontium is present.
0dfe14d		Fix type lookups in case its unknown from the SDE.
402f007		fix: Roleconfiguration template tried to access removed property (#159)
118b44c		Fix indentation.
b3ced55		filtering displayed skills and wallet information according to permission on character sheet layout (#160)
```
### 3.0.0-beta11
```
5be4077		v3.0.0-beta11
f55e850		Handle a case where worker counts cant be set without the DB.
```
### 3.0.0-beta12
```
fb93023		v3.0.0-beta12
6e4887b		Update links for eveboard to eveskillboard (#165)
cdfbccf		Update log.blade.php (#164)
4cbd395		fix: The characters ship will now get displayed properly. (#163)
f68bb58		eveseat/seat#310: Fixes broken login via admin link (#162)
```
### 3.0.0-beta13
```
b97ddbf		v3.0.0-beta13
3d7f305		Make user listing table responsive.
015fcc6		Reshuffle the dashboard widgets.
910e4d9		Link the email attribute to the User model.
106cd46		Replace character switcher with modal to handle large groups.
f0899dc		Apply fixes from StyleCI (#167)
880eaa7		Move main char and email to a setting for a group.
07a18b4		updated missing fields in web app manifest (#166)
```
### 3.0.0-beta14
```
b925e7f		v3.0.0-beta14
3c43088		remove ability to bind admin user to EVE (#170)
abbc9e9		provide extra helper attribute to Group (#169)
632493b		fix sorting on user table for refresh token and last login columns (#168)
```
### 3.0.0-beta15
```
ba1abce		v3.0.0-beta15
6c0e93f		Allow for user group reassignment.
843a941		Add character attributes.
6f6d340		Add corporation structures view.
3392e1a		Specify the horizon job timeout.
```
### 3.0.0-beta16
```
cc500cc		v3.0.0-beta16
a76eca1		Return MainCharacter of Group (#171)
```
### 3.0.0-beta17
```
5ae4303		v3.0.0-beta17
e371c6d		Fix settings relationship.
```
### 3.0.0-beta18
```
eab5e0d		v3.0.0-beta18
70d8269		Apply fixes from StyleCI (#175)
61e9e4e		Add ability to delete characters & corporations via the Web UI.
2623e24		Update wording.
34c3ab0		Add stale data cleanup setting for maintenance job.
593e74e		Apply fixes from StyleCI (#174)
767cb57		Expose ESI status to the WEB UI.
b45daae		append counter on tracking footer (#173)
```
### 3.0.0-beta19
```
a06d226		v3.0.0-beta19
795a49a		Handle an empty ESI statys gracefully.
```
### 3.0.0-beta20
```
f6cd5aa		v3.0.0-beta20
4091f3f		Add view to see character fittings.
816dfa9		Cleanup orphan groups when deleting / re-assigning users.
```
### 3.0.0-beta21
```
0957696		v3.0.0-beta21
b4a90be		Remove debug code.
736e9bd		Update user list to show groups.
810cabc		Update token deletes as it now has soft deletes.
85bfd44		Update chinese language file (#180)
25aff8d		fix column name according to ESI design (#179)
```
### 3.0.0-beta22
```
de1c76f		v3.0.0-beta22
2f95358		Include user count.
2dfe458		Refactor user / group listing, again.
0171c24		Remove unused variable and add refactor warning.
30f722b		Fix user layout (#181)
```
### 3.0.1
```
713f8e3		v3.0.1
ec4f257		Fix starbase stats (#184)
13f20a7		v3.0.0 🎉
6e1b466		Show email address in user list.
13d8183		fix skill training human conversion (#183)
27d29a4		Fix character standings view.
11e5ff2		Paginate standings view.
cdbf668		Remove mcrypt dependency for PHP 7.2 support.
736375d		Add more character manual update dispatchers.
23ec965		Remove old supervisor integration config.
7a64386		Rename key to token.
bb5dacc		fix starbase layout (progress and offline timer) (#182)
```
### 3.0.2
```
448d81b		v3.0.2
3e7c945		reinsert button for edit/delete/impersonate function (#186)
0d6132e		improve id to name resolver in order to support resolving in link (#185)
```
### 3.0.3
```
ce01e3d		v3.0.3
0185d53		Temporarily remove the location_id column.
dbdb06b		Include the reason if available in wallet journal.
ac70a1e		Workaround for corporation name resolution bugs.
f639634		Remove empty groups when linking existing characters.
2d997d6		Move action buttons to the right (#187)
b602265		Fix number formatting with spaces.
e97f66a		Add overview box with total mined isk (#189)
eff0739		respect number format from user settings (#191)
2f033cc		Update ScheduleController.php (#190)
```
### 3.0.4
```
1aa780a		v3.0.4
5b819ed		[Critical Hotfix] login flow issues (#195)
```
### 3.0.5
```
859c36f		v3.0.5
f1c01ba		fix(corporation structures): Fix table sort on offline column (#198)
33cd56a		Generate complete documentation for user category (HTTP/200) (#196)
9c8793c		fix extractor progress-bar in character PI layout (#192)
```
### 3.0.6
```
a9a26d8		v3.0.6
6e7f008		fix(industry jobs): Fix datatable search (#204)
af93484		Refactor a switch for a simple ternary operator.
f9a8625		Add tab for users with `character.list` permission (#207)
1702f5c		Add token status linked characters (#205)
6b9c67e		fix(industry jobs): Fix location field (#203)
2899e90		feat(industry jobs): Add end column to industry jobs table (#202)
82954c2		fix(corporation tracking): fix last location column (#201)
8dd5d2a		fix(jump clones): Display name of player structure (#200)
399b8c8		feat(contacts): Bump corporation and character contact endpoint to v2 (#199)
```
### 3.0.7
```
8f49b5d		v3.0.7
3916281		fix(corporation): Fix number sort on bounty ledger (#211)
52a7d2d		fix(character): Address an issue related to filter on industry page (#210)
```
### 3.0.8
```
66ba408		v3.0.8
0a9ef8c		fix(characters list): Make all character related to authenticated user visible
```
### 3.0.9
```
44d4ff5		v3.0.9
b5b0279		fix(language): Add missing translation constants
5e35fe7		feat(language): Add russian support
91f2cdb		feat(ui): Add ability to load content into right control sidebar
848c442		feat(prices): Lock mining values
535575c		Fix no_corporation_titles translation (#215)
```
### 3.0.10
```
e396edd		build(core): v3.0.10
4a31104		fix(corporation): Update corporation killmails according to partials update
3d6dcfe		fix(corporation): Update corporation journal according to partials update
768540f		fix(corporation): Update corporation market according to partials updates
c7b1687		fix(character): Fix attributes null exceptions
0487d5c		fix(character): Fix a null exception which may occures when the character information wasn't already pulled
60348e8		fix(transactions): Fix Sold transaction styling
4002c08		[feat](mails): Mailtimeline Improvement: only link existing characters and corporations (#243)
7864e9c		[feat](market): Update market tab and refactor partials (#240)
4a92912		[feat](characters): Make the list sorteable by name and turn into async
0cecc79		[feat](transactions): Move to asynchronous loading
7ff4220		[feat](mails): Move to asynchronous loading
83e0e99		[feat](wallets): Move to asynchronous loading
aea1dce		[feat](killmails): Move to asynchronous loading
a1274fa		style(users): Code format
c47244f		[feat](users): Move to asynchronous loading
a42805f		style(core): Code format
aa1f785		[feat](core): Resolve ids universe names (#236)
eba65dd		[feat](core): Use new migration mechanic
1f59798		style(contract): Code format
accd83e		[feat](contracts): Move to asynchronous loading
890b7a6		feat(core): Provide events when a role is attached or detached from a group (#228)
b84f4b9		style(assets): Code format
86b8dd9		[feat](assets): Move to asynchronous loading
379bd57		[feat](contacts): Move to asynchronous loading
1d67235		[feat](dependencies): Update DataTables Dependencies for new DataTables Version (#221)
01631c5		[fix](assets): Add missing EVE Logo
945dc95		[feat](profile): Provide a link to characters
5bcb533		[fix](mining-ledger): fix ErrorException for undefined variable character_id
554fe56		fix(settings): Fix GA tracking explanation dead link (#226)
794edd4		fix(mining ledger): Fix loading time issue due to prices eager-load (#225)
fb36916		style(resolver): rename methods from resolveEntityIDsFromSeat to resolverInternalEntityIDs
ba8a4ff		feat(resolver): Improve resolver using local database information
4115a79		[fix](characters) Avoid the group table from characters list to throw an exception on Admin user
80729f2		[feat](api) Add main_character_id to group-list
250db17		[feat](corporation) Include main character into Corporation Mining Ledger
3166690		[feat](corporation) Include main character into MemberTracking
```
