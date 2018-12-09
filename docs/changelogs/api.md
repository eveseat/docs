![SeAT](http://i.imgur.com/aPPOxSK.png)

# api change logs
Generated with: `git log --pretty=format:%h%x09%x09%s`

### 1.0.0
```
03064d4		Add admin views, complete middleware and add menu.
c11ca2e		Add Corporation API Endpoints
122f2da		Add Character API Endpoints
dda7cbb		Add endpoint to validate credentials
014502b		Add roles and permissions query endpoint
4e88616		Add endpoints to get Role information
4516aaa		Add CRUD for User management
2d129ea		Update links to eveseat/api
2c2cef3		Fix typo
5620aa2		Update README
6905c26		Compelte the EVE API Key API
32d17cf		First preperations for the SeAT API
57f8c6d		first commit
```
### 1.0.1
```
cc4ea85		Version Bump
16c3896		Dont use a sub-menu
88348cb		Cleanup Middleware and add Request Path logging
```
### 1.0.2
```
de62767		Update README.md
```
### 1.0.3
```
dee0f28		Version Bump
76647e9		Add localization support
```
### 1.0.4
```
3b80952		Version Bump
55269b9		Add char & corp Bookmarks endpoints
b65799f		Add Character Channels endpoint
```
### 1.0.5
```
220b7bb		Version Bump
86c4602		Specify versions with ~
```
### 1.0.6
```
a949267		Version Bump
8f5c35f		Allow for API Keys to be transferred to a different User
c712823		Add starbase and assets-by-location endpoints
```
### 1.0.7
```
6ca59b0		Version Bump
603cb76		Add ability to get a specific starbases info
```
### 1.0.8
```
2409d0c		Version Bump
ad8351a		Add Corp Pocos Endpoint
```
### 1.0.9
```
22f8b34		Version Bump
f6bfc7e		Update copyright
7f24bf8		Code style fixes
```
### 1.0.10
```
3faff1e		Version Bump
99871c9		Rename repository method that was incorrectly called
131a3b8		Add /api/v1/corporation/all endpoint
be8e6aa		Include key info and characters.
```
### 1.0.11
```
d35e7ef		Version Bump
60475a4		Add /api/v1/corporation/assets-contents/{corp_id} endpoint
530703c		Add missing PPHDoc comment for argument
```
### 1.0.12
```
fbf3e88		Version Bump
e8f1882		Fix eveseat/seat#115 by adding new endpoints for role management
729971f		Convert from a resource to controller route for roles
d2ff1df		Merge pull request #1 from nizzan/patch-1
dc80447		Typo on API Token generation
```
### 1.0.13
```
b55b1aa		Version Bump
8b80e11		Paginate the token logs
```
### 2.0.0
```
a1ef4d3		Version Bump! 2.0.0! ⚡️
cd107a5		Drop minimum stability, add prefer-stable and bump to 2.0.0-alpha2.
2d66b64		Update composer for 2.0 packages and version 2.0.0-alpha1
92a189e		Bump to 2.0.0-dev
2485046		Remove unused precedence rule
80c3d0e		Code formatting fixes
6d28aff		Extend new core controllers instead of base in App namespace
4f74325		Update to make use of new corp repository classes
39237e8		Update to use new classes from the the repository
db6db82		Fix middleware to include new `web` middleware.
ba92bd6		Update PHP & Laravel dependencies
dc8136f		Update Form Request validation to use new base class
7ebe1db		Convert `Route::controller` methods to explicit routes
```
### 2.0.0-alpha1
```

```
### 2.0.0-alpha2
```
cd107a5		Drop minimum stability, add prefer-stable and bump to 2.0.0-alpha2.
```
### 2.0.0-dev
```

```
### 2.0.1
```
9a5b152		Version Bump
d457eeb		Fix namespace for Validator
a1ef4d3		Version Bump! 2.0.0! ⚡️
cd107a5		Drop minimum stability, add prefer-stable and bump to 2.0.0-alpha2.
2d66b64		Update composer for 2.0 packages and version 2.0.0-alpha1
```
### 2.0.2
```
5a115a0		Version Bump
ca57ce6		Set a user_id if one is not given.
```
### 2.0.3
```
3b90fea		Version Bump
8cd58b1		Fix eveseat/seat#156 by adding the optional starbase_id param.
```
### 2.0.4
```
6fb753f		Version Bump
619d48d		Update internal menu name
```
### 2.0.5
```
7b91b04		Version Bump
8c3004d		Update styleci config
44dbb59		Add StyleCI badge.
b11d5c5		Apply fixes from StyleCI (#2)
7f7674d		Add StyleCI configuration
```
### 2.0.6
```
24ec51c		Version Bump
56c550e		Apply fixes from StyleCI (#3)
5d0b17f		Add groups/ and groups/{id} endpoints.
1ee8e81		Add codeclimate configuration
```
### 2.0.7
```
18a75cc		Version Bump
2716318		fix middleware flow for bouncer null exception (#4)
```
### 2.0.8
```
88a519c		Version Bump
85f2c98		Apply fixes from StyleCI (#7)
f345da5		Small cleanup
645a369		Keys duplication (#6)
1b16132		Updating routes.php to include member tracking url (#5)
```
### 2.0.9
```
36c8592		Version Bump
8c6e4e3		Style fixes.
91c33bf		Update role (#8)
38d0fc8		fix api log issue (#10)
```
### 2.0.10
```
a36841b		Version Bump.
7293928		security hotfix related to API log which add missing method column (#12)
```
### 3.0.0
```
a592a59		v3.0.0 🎉
31f88e0		Style fix.
81bf6d3		Add ability to populate and retreive refresh tokens.
0f75f3f		Fix class order.
99e5376		Move validation classes namespace.
cbabab1		Remove old validation rules.
be53e61		Expose user token via API
689a886		v3.0.0-beta5
35012f3		Fix method name.
e8c7137		Fix grouprelationship (#17)
57b2b86		Add link to API documentation.
9d24246		Apply fixes from StyleCI (#16)
73c4945		v3.0.0-beta4
bd36017		Compelte API migration to v2 & Swagger.
482d09a		Start adding user management v2 endpoints.
ebaeaed		Add v2 Corporation API endpoints and remove v1 endpoints.
1fc7fc3		v3.0.0-beta3
4fda254		Remove old API controllers.
6f7952c		Complete v2 character level API endpoints.
eac5238		Migrate and document more endpoints.
321666b		Start the v2, swaggified API.
30117e0		Remove unused trait.
6dbd039		v3.0.0-beta2
2d32c6e		Package upgarde and v3.0.0-beta1.
3d941cb		Apply fixes from StyleCI (#15)
bbe233c		Indentation fixes.
a773f77		Apply fixes from StyleCI (#14)
d98f460		Update middleware registers for Laravel 5.5.
```
### 3.0.0-beta1
```

```
### 3.0.0-beta2
```
6dbd039		v3.0.0-beta2
```
### 3.0.0-beta3
```
1fc7fc3		v3.0.0-beta3
4fda254		Remove old API controllers.
6f7952c		Complete v2 character level API endpoints.
eac5238		Migrate and document more endpoints.
321666b		Start the v2, swaggified API.
30117e0		Remove unused trait.
```
### 3.0.0-beta4
```
73c4945		v3.0.0-beta4
bd36017		Compelte API migration to v2 & Swagger.
482d09a		Start adding user management v2 endpoints.
ebaeaed		Add v2 Corporation API endpoints and remove v1 endpoints.
```
### 3.0.0-beta5
```
689a886		v3.0.0-beta5
35012f3		Fix method name.
e8c7137		Fix grouprelationship (#17)
57b2b86		Add link to API documentation.
9d24246		Apply fixes from StyleCI (#16)
```
### 3.0.1
```
9c531be		v3.0.1
6ba9e60		fix issue which was preventing to use swagger UI to test endpoints (#22)
f4f6657		improve api logging by appending request method. Use swagger color chart (#23)
6b3ecdd		Improve api docs (#21)
e82a756		Formatting fixes.
f44c675		add group control logic in order to deny addition to admin group (#20)
292acd5		Generate API based on multiple paths (allow api documentation for plugins) (#19)
a592a59		v3.0.0 🎉
31f88e0		Style fix.
81bf6d3		Add ability to populate and retreive refresh tokens.
0f75f3f		Fix class order.
99e5376		Move validation classes namespace.
cbabab1		Remove old validation rules.
be53e61		Expose user token via API
```
### 3.0.2
```
cbfcf00		v3.0.2
1961df9		feat(character): Provide skillpoints and unallocated skillpoints into character sheet endpoint (#25)
fcafab2		feat(users): Add pagination to users list (#24)
```
### 3.0.3
```
ee60536		v3.0.3
3230d41		Temporarily pin zircote/swagger-php.
```
### 3.0.4
```
9351a4f		v3.0.4
3ec50da		Drop the Swagger version number.
4bf5ab7		Pin swagger-php more gnerically.
```
### 3.0.5
```
fbb608a		build(core): v3.0.5
06fd5b3		[feat](core): Use new migration mechanic
55b372d		[feat](api) Add main_character_id to group-list
```
