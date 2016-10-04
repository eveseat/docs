![SeAT](http://i.imgur.com/aPPOxSK.png)

# SeAT Roles, Permissions and Authorization

All endpoints in this document are for version1 (`/api/v1`) of the SeAT API.  
All methods below have the requests and responses sampled using [httpie](https://github.com/jkbrzt/httpie).

# Available Methods
* [List All](#list-all-roles)
* [Show Detail](#show-role-detail)
* [List Available Permissions](#list-all-permissions)
* [Create New Role](#create-new-role)
* [Grant User a Role](#grant-user-a-role)
* [Delete Role](#delete-role)
* [Revoke Role from User](#revoke-user-from-role)
* [User has Role](#user-has-role)
* [User has Permission](#user-has-permission)
* [Validate SeAT Credentials](#validate-seat-credentials)

***

### List all Roles

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/role` |
| Description   | List all recorded Roles from the database. |

Sample Request:
```bash
http get http://localhost:8000/api/v1/role Accept:application/json X-Token:123456
```

Sample Response:
```json
[
    {
        "id": 1,
        "title": "Superuser"
    },
    {
        "id": 2,
        "title": "Corp Accountants"
    }
]
```

***

### Show Role Detail

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/role/detail/{identifier}` |
| Description   | Get details for a single SeAT Role. Shows Users with the Role, Permissions as well as Affiliations. |
| Parameters    |  **identifier** - The identifier for the Role. Can be either the role_id or title |

Sample Request:
```bash
http get http://localhost:8000/api/v1/role/2 Accept:application/json X-Token:123456
```

Sample Response:
```json
{
    "affiliations": [
        {
            "affiliation": 123456,
            "id": 2,
            "pivot": {
                "affiliation_id": 2,
                "role_id": 2
            },
            "type": "corp"
        }
    ],
    "id": 2,
    "permissions": [
        {
            "id": 2,
            "pivot": {
                "permission_id": 2,
                "role_id": 2
            },
            "title": "corporation.wallet_journal"
        }
    ],
    "title": "Corp Accountants",
    "users": [
        {
            "active": 0,
            "created_at": "2015-11-21 14:12:07",
            "email": "admin@seat.local",
            "id": 1,
            "last_login": "2015-11-30 03:55:44",
            "last_login_source": "::1",
            "name": "admin",
            "pivot": {
                "role_id": 2,
                "user_id": 1
            },
            "updated_at": "2015-11-30 03:55:44"
        },
        {
            "active": 0,
            "created_at": "2015-11-26 18:58:29",
            "email": "test@test.com",
            "id": 2,
            "last_login": "2015-11-26 18:58:29",
            "last_login_source": "::1",
            "name": "test",
            "pivot": {
                "role_id": 2,
                "user_id": 2
            },
            "updated_at": "2015-11-26 21:11:12"
        }
    ]
}
```

***

### List all Permissions

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/role/query/permissions` |
| Description   | List all of the possible SeAT Permissions. |

Sample Request:
```bash
http get http://localhost:8000/api/v1/role/query/permissions Accept:application/json X-Token:123456
```

Sample Response:
```json
{
    "0": "superuser",
    "1": "queue_manager",
    "apikey": [
        "delete",
        "detail",
        "toggle_status",
        "list",
        "update"
    ],
    "character": [
        "assets",
        "calendar",
        "contacts",
        "contracts",
        "industry",
        "killmails",
        "list",
        "mail",
        "market_orders",
        "notifications",
        "pi",
        "research_agents",
        "skills",
        "standings",
        "sheet",
        "wallet_journal",
        "wallet_transactions"
    ]
}
```

***

### Create New Role

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **POST** |
| Endpoint      | `/api/v1/role/new` |
| Description   | Create a new SeAT role. |
| Parameters    |  **name** - The name for the new Role. |

Sample Request:
```bash
http post http://localhost:8000/api/v1/role/new name=api_test Accept:application/json X-Token:123456
```

Sample Response:
```json
true
```

***

### Delete Role

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **DELETE** |
| Endpoint      | `/api/v1/role/remove/{role_id}` |
| Description   | Delete a SeAT role. |
| Parameters    |  **role_id** - The id for the Role to delete. |

Sample Request:
```bash
http delete http://localhost:8000/api/v1/role/remove/3 Accept:application/json X-Token:123456
```

Sample Response:
```json
true
```

***

### Grant User a Role

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/role/grant-user-role/{user_id}/{role_id}` |
| Description   | Grant a SeAT user a SeAT role. |
| Parameters    |  **user_id** - The id for the User. |
|     |  **role_id** - The id for the Role. |

Sample Request:
```bash
http get http://localhost:8000/api/v1/role/grant-user-role/2/2 \
    Accept:application/json X-Token:123456
```

Sample Response:
```json
true
```

***

### Revoke User from Role

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/role/revoke-user-role/{user_id}/{role_id}` |
| Description   | Remove a SeAT user from a SeAT role. |
| Parameters    |  **user_id** - The id for the User. |
|     |  **role_id** - The id for the Role. |

Sample Request:
```bash
http get http://localhost:8000/api/v1/role/revoke-user-role/2/2 \
    Accept:application/json X-Token:123456
```

Sample Response:
```json
true
```

***


### User has Role

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/role/query/role-check/{user_identifier}/{role_identifier}` |
| Description   | Determine if a SeAT user has a specific SeAT Role. |
| Parameters    |  **user_identifier** - The identifier for the User. Can be either the user_id or name |
|     |  **role_identifier** - The identifier for the Role. Can be either the role_id or title |

Sample Request:
```bash
// Note the quotes around the URL. If your role names have spaces in them,
// make sure you properly url encode them before adding it to the URL itself.
http get "http://localhost:8000/api/v1/role/query/role-check/admin/Corp Accountants" \
    Accept:application/json X-Token:123456
```

Sample Response:
```json
true
```

***

### User has Permission

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/role/query/permission-check/{user_identifier}/{permission}` |
| Description   | Determine if a SeAT user has a specific SeAT Permission. **NOTE** This endpoint does not honor affiliation rules! |
| Parameters    |  **user_identifier** - The identifier for the User. Can be either the user_id or name. |
|     |  **permission** - The identifier for the Permission. Available permissions can be found at the [permissions list](#list-all-permissions). |

Sample Request:
```bash
http get http://localhost:8000/api/v1/role/query/permission-check/test/corporation.assets \
    Accept:application/json X-Token:123456
```

Sample Response:
```json
false
```

***

### Validate SeAT Credentials

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **POST** |
| Endpoint      | `/api/v1/user/auth/login` |
| Description   | Validates a SeAT accounts credentials |
| Parameters    |  **username** - The username. |
|     |  **password** - The password for the user. |

Sample Request:
```bash
http post http://localhost:8000/api/v1/user/auth/login Accept:application/json \
    X-Token:123456 username=api_user password=blahblah
```

Sample Response:
```json
true
```
