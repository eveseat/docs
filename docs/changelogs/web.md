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
### 2.0.0-alpha1
```
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
### 2.0.0-alpha2
```
680e4a3		Drop minimum stability, add prefer-stable and bump to 2.0.0-alpha2.
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
