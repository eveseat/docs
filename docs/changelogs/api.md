![SeAT](https://i.imgur.com/aPPOxSK.png)

# api change logs
Generated with: `git log --pretty=format:"%h%>(12)%ad %<(7)%aN%d %s" --date=short`

### 1.0.0
```
03064d4  2015-11-30 Leon Jacobs (tag: 1.0.0) Add admin views, complete middleware and add menu.
c11ca2e  2015-11-30 Leon Jacobs Add Corporation API Endpoints
122f2da  2015-11-30 Leon Jacobs Add Character API Endpoints
dda7cbb  2015-11-30 Leon Jacobs Add endpoint to validate credentials
014502b  2015-11-30 Leon Jacobs Add roles and permissions query endpoint
4e88616  2015-11-30 Leon Jacobs Add endpoints to get Role information
4516aaa  2015-11-29 Leon Jacobs Add CRUD for User management
2d129ea  2015-11-29 Leon Jacobs Update links to eveseat/api
2c2cef3  2015-11-29 Leon Jacobs Fix typo
5620aa2  2015-11-29 Leon Jacobs Update README
6905c26  2015-11-29 Leon Jacobs Compelte the EVE API Key API
32d17cf  2015-11-29 Leon Jacobs First preperations for the SeAT API
57f8c6d  2015-11-28 Leon Jacobs first commit
```
### 1.0.1
```
cc4ea85  2015-12-01 Leon Jacobs (tag: 1.0.1) Version Bump
16c3896  2015-12-01 Leon Jacobs Dont use a sub-menu
88348cb  2015-12-01 Leon Jacobs Cleanup Middleware and add Request Path logging
```
### 1.0.2
```
de62767  2015-12-04 Leon Jacobs (tag: 1.0.2) Update README.md
```
### 1.0.3
```
dee0f28  2015-12-16 Leon Jacobs (tag: 1.0.3) Version Bump
76647e9  2015-12-16 Leon Jacobs Add localization support
```
### 1.0.4
```
3b80952  2015-12-20 Leon Jacobs (tag: 1.0.4) Version Bump
55269b9  2015-12-20 Leon Jacobs Add char & corp Bookmarks endpoints
b65799f  2015-12-20 Leon Jacobs Add Character Channels endpoint
```
### 1.0.5
```
220b7bb  2015-12-24 Leon Jacobs (tag: 1.0.5) Version Bump
86c4602  2015-12-24 Leon Jacobs Specify versions with ~
```
### 1.0.6
```
a949267  2015-12-26 Leon Jacobs (tag: 1.0.6) Version Bump
8f5c35f  2015-12-26 Leon Jacobs Allow for API Keys to be transferred to a different User
c712823  2015-12-26 Leon Jacobs Add starbase and assets-by-location endpoints
```
### 1.0.7
```
6ca59b0  2015-12-27 Leon Jacobs (tag: 1.0.7) Version Bump
603cb76  2015-12-27 Leon Jacobs Add ability to get a specific starbases info
```
### 1.0.8
```
2409d0c  2015-12-28 Leon Jacobs (tag: 1.0.8) Version Bump
ad8351a  2015-12-28 Leon Jacobs Add Corp Pocos Endpoint
```
### 1.0.9
```
22f8b34  2016-01-26 Leon Jacobs (tag: 1.0.9) Version Bump
f6bfc7e  2016-01-26 Leon Jacobs Update copyright
7f24bf8  2016-01-06 Leon Jacobs Code style fixes
```
### 1.0.10
```
3faff1e  2016-04-29 Leon Jacobs (tag: 1.0.10) Version Bump
99871c9  2016-04-29 Leon Jacobs Rename repository method that was incorrectly called
131a3b8  2016-04-29 Leon Jacobs Add /api/v1/corporation/all endpoint
be8e6aa  2016-04-29 Leon Jacobs Include key info and characters.
```
### 1.0.11
```
d35e7ef  2016-06-26 Leon Jacobs (tag: 1.0.11) Version Bump
60475a4  2016-06-26 Leon Jacobs Add /api/v1/corporation/assets-contents/{corp_id} endpoint
530703c  2016-06-26 Leon Jacobs Add missing PPHDoc comment for argument
```
### 1.0.12
```
fbf3e88  2016-07-10 Leon Jacobs (tag: 1.0.12) Version Bump
e8f1882  2016-07-10 Leon Jacobs Fix eveseat/seat#115 by adding new endpoints for role management
729971f  2016-07-10 Leon Jacobs Convert from a resource to controller route for roles
d2ff1df  2016-06-28 Leon Jacobs Merge pull request #1 from nizzan/patch-1
dc80447  2016-06-28 nizzan  Typo on API Token generation
```
### 1.0.13
```
b55b1aa  2016-07-23 Leon Jacobs (tag: 1.0.13) Version Bump
8b80e11  2016-07-18 Leon Jacobs Paginate the token logs
```
### 2.0.0-alpha1
```
2d66b64  2016-11-26 Leon Jacobs (tag: 2.0.0-alpha1) Update composer for 2.0 packages and version 2.0.0-alpha1
92a189e  2016-11-26 Leon Jacobs (tag: 2.0.0-dev) Bump to 2.0.0-dev
2485046  2016-11-19 Leon Jacobs Remove unused precedence rule
80c3d0e  2016-11-05 Leon Jacobs Code formatting fixes
6d28aff  2016-11-05 Leon Jacobs Extend new core controllers instead of base in App namespace
4f74325  2016-10-25 Leon Jacobs Update to make use of new corp repository classes
39237e8  2016-10-25 Leon Jacobs Update to use new classes from the the repository
db6db82  2016-10-23 Leon Jacobs Fix middleware to include new `web` middleware.
ba92bd6  2016-10-23 Leon Jacobs Update PHP & Laravel dependencies
dc8136f  2016-10-23 Leon Jacobs Update Form Request validation to use new base class
7ebe1db  2016-10-23 Leon Jacobs Convert `Route::controller` methods to explicit routes
```
### 2.0.0-alpha2
```
cd107a5  2016-11-26 Leon Jacobs (tag: 2.0.0-alpha2) Drop minimum stability, add prefer-stable and bump to 2.0.0-alpha2.
```
### 2.0.0-dev
```

```
### 2.0.0
```
a1ef4d3  2016-12-08 Leon Jacobs (tag: 2.0.0) Version Bump! 2.0.0! ⚡️
cd107a5  2016-11-26 Leon Jacobs (tag: 2.0.0-alpha2) Drop minimum stability, add prefer-stable and bump to 2.0.0-alpha2.
2d66b64  2016-11-26 Leon Jacobs (tag: 2.0.0-alpha1) Update composer for 2.0 packages and version 2.0.0-alpha1
```
### 2.0.1
```
9a5b152  2016-12-10 Leon Jacobs (tag: 2.0.1) Version Bump
d457eeb  2016-12-10 Leon Jacobs Fix namespace for Validator
```
### 2.0.2
```
5a115a0  2016-12-11 Leon Jacobs (tag: 2.0.2) Version Bump
ca57ce6  2016-12-11 Leon Jacobs Set a user_id if one is not given.
```
### 2.0.3
```
3b90fea  2016-12-13 Leon Jacobs (tag: 2.0.3) Version Bump
8cd58b1  2016-12-12 Leon Jacobs Fix eveseat/seat#156 by adding the optional starbase_id param.
```
### 2.0.4
```
6fb753f  2016-12-28 Leon Jacobs (tag: 2.0.4) Version Bump
619d48d  2016-12-26 Leon Jacobs Update internal menu name
```
### 2.0.5
```
7b91b04  2017-01-12 Leon Jacobs (tag: 2.0.5) Version Bump
8c3004d  2017-01-04 Leon Jacobs Update styleci config
44dbb59  2017-01-02 Leon Jacobs Add StyleCI badge.
b11d5c5  2017-01-02 Leon Jacobs Apply fixes from StyleCI (#2)
7f7674d  2017-01-02 Leon Jacobs Add StyleCI configuration
```
### 2.0.6
```
24ec51c  2017-01-22 Leon Jacobs (tag: 2.0.6) Version Bump
56c550e  2017-01-22 Leon Jacobs Apply fixes from StyleCI (#3)
5d0b17f  2017-01-22 Leon Jacobs Add groups/ and groups/{id} endpoints.
1ee8e81  2017-01-20 Leon Jacobs Add codeclimate configuration
```
### 2.0.7
```
18a75cc  2017-01-31 Leon Jacobs (tag: 2.0.7) Version Bump
2716318  2017-01-31 Loïc LEUILLIOT fix middleware flow for bouncer null exception (#4)
```
### 2.0.8
```
88a519c  2017-04-17 Leon Jacobs (tag: 2.0.8) Version Bump
85f2c98  2017-04-17 Leon Jacobs Apply fixes from StyleCI (#7)
f345da5  2017-04-17 Leon Jacobs Small cleanup
645a369  2017-04-17 Loïc LEUILLIOT Keys duplication (#6)
1b16132  2017-03-29 NoMercy82 Updating routes.php to include member tracking url (#5)
```
### 2.0.9
```
36c8592  2017-08-12 Leon Jacobs (tag: 2.0.9) Version Bump
8c6e4e3  2017-08-12 Leon Jacobs Style fixes.
91c33bf  2017-08-12 Loïc LEUILLIOT Update role (#8)
38d0fc8  2017-08-12 Loïc LEUILLIOT fix api log issue (#10)
```
