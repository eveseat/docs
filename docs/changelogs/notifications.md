![SeAT](http://i.imgur.com/aPPOxSK.png)

# notifications change logs
Generated with: `git log --pretty=format:%h%x09%x09%s`

### 1.0.0
```
15b1175		Add views to see notifications
fd76941		Fix typo
a5f93e7		Update README
c22a837		First iteration of the notification package
032bebf		first commit
```
### 1.0.1
```
6594754		Version Bump
ccf7596		Update README.md
70994aa		Add more complete message
```
### 1.0.2
```
aedd78a		Version Bump
a2e7ddf		Add suport for lacalization
```
### 1.0.3
```
d47b267		Version Bump
e0a5b53		Specify Versions with ~
```
### 1.0.4
```
c115945		Version Bump
7b0cd6f		Update copyright
23e89b1		Code style fix
```
### 2.0.0-alpha1
```
8d631d0		Update composer for 2.0 packages and version 2.0.0-alpha1
9a7af30		Add character mail alert.
e72475f		Add new api key added alert.
5c72ad8		Add member api state change alert.
177b12e		Add a starbase state change alert.
d415584		Give alerts pretty names.
0a6f74a		Style fixes
de0b6cb		Add a command handler & schedule for alerts.
b444b41		Add localization strings
cd4a801		Add notifications history to prevent duplicate notifications.
a37a62b		Add alert for starbase fuel levels.
c75715f		Apply affiliation rules to Notification Groups that have them set.
d4ade00		Add Inactive Corp Member notification.
88f5d8f		Only fire alerts to groups with the actual alert configured.
d2cd290		Add time to player count notification
858f4e8		Ensure that only a single integration of a type can be added
bd0443c		Add ability to delete a notifications group.
8678921		Add ability to modify notification groups.
895e510		Allow for integrations to be deleted.
784f040		Add a player count notification to test.
aae1201		Add missing docblocks
474dd80		Restore the old structure on `down()`
3ab8b06		Major notifications refactor to support L5.3 features.
d1614c8		Code formatting fixes
353d04c		Extend new core controllers instead of base in App namespace
6caa863		Update PHP & Laravel dependencies. Remove psr/log dependency.
624e13c		Apply new global web middleware
```
### 2.0.0-alpha2
```
e9b2b42		Drop minimum stability, add prefer-stable and bump to 2.0.0-alpha2.
```
### 2.0.0
```
125db68		Version Bump! 2.0.0! ⚡️
88ac259		Codestyle fixes.
```
### 2.0.1
```
acdaa9d		Version bump
ec3a05f		Add corporation killmails notification.
```
### 2.0.2
```
070c7c3		Version Bump
4101a77		Format security status number and specify if killmail is a loss.
c7d6a05		Improve performace by reducing mail scope to 1 week
0c3b224		Correctly affiliate by ownerID instead of corporationID
```
### 2.0.3
```
452a409		Version Bump
02ce790		Temporarily Disable the Member API State Alert
```
### 2.0.4
```
cfb4fdc		Version Bump
5e66f49		Throttle notifications to prevent HTTP 429's.
cf8541b		Small refactor of siphon detection `getData` method to use collections.
72f7d13		Merge pull request #3 from karbowiak/master
595db6c		Remove sleep again.. replace with token bucket or something similar at a later point
af2d7c1		Fix chmod
effc7a8		Add Siphon Alerts
c9038d6		Add sleep(1) to the slack notifications, to make it sleep for a full second before sending out each message.. To stop Slack/Discord from 429'ing..
69bdf77		Merge pull request #1 from warlof/typo
f0157c7		fix typo on notification message
```
### 2.0.5
```
de3ba6b		Version Bump
fa312ca		Fix typo
f0e928b		Fix email notifications for StarbaseSiphon detection
```
### 2.0.6
```
4738228		Version Bump
9bebd32		Update siphon detection to use # of items and not volume.
```
### 2.0.7
```
b7a8ed2		Version Bump
b5126d3		Update styleci config
b95d799		Apply fixes from StyleCI (#4)
04caec8		Add StyleCI badge
7f5c4a2		Add StyleCI configuration
```
### 2.0.8
```
b25146f		Version Bump
f26e906		fix middleware flow in order to avoid null exception on bouncer (#5)
bbc09a0		Add codeclimate configuration
```
### 2.0.9
```
bd9bbb0		Version Bump
6ff4a1b		Reduce one level of indentation.
ce58c03		Starbase Siphon alert hotfix (#6)
```
### 2.0.10
```
8632037		Version Bump
5172e72		Formatting, language and style fixes.
19b57dd		improve slack notification for killmail (#7)
```
### 2.0.11
```
e760f9d		Version bump
49d515e		Update wording.
cbfac3e		Remove debug line.
```
