![SeAT](http://i.imgur.com/aPPOxSK.png)

# EVE API Keys

All endpoints in this document are for version1 (`/api/v1`) of the SeAT API.  
All methods below have the requests and responses sampled using [httpie](https://github.com/jkbrzt/httpie).

# Available Methods
* [List All](#list-all-eve-api-keys)
* [List Single](#get-a-single-eve-api-key)
* [Add an EVE API Key](#add-an-eve-api-key)
* [Edit an EVE API Key](#edit-an-eve-api-key)
* [Delete an EVE API Key](#delete-an-eve-api-key)
* [Transfer an EVE API Key](#transfer-an-eve-api-key)

***

### List all EVE API Keys

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/key` |
| Description   | List all recorded EVE API Keys from the database. |

Sample Request:
```bash
http get http://localhost:8000/api/v1/key Accept:application/json X-Token:123456
```

Sample Response:
```json
{
    "created_at": "2015-11-21 14:12:40",
    "disabled_calls": null,
    "enabled": 1,
    "key_id": 123445,
    "last_error": "221:Illegal page request! Please verify the access granted by the key you are using!",
    "updated_at": "2015-11-21 14:14:11",
    "user_id": 1,
    "v_code": "IDT1wqjWtl9QGFGHPb5Zj0kle7EnQxWDiscH64aN44qhE07oOBTfCCLFmc3uj2Hf"
}
```

***

### Get a single EVE API Key

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/key/{key_id}` |
| Description   | Get details for a single EVE API Key. |
| Parameters    |  **key_id** - The keyID to retrieve |

Sample Request:
```bash
http get http://localhost:8000/api/v1/key/123445 Accept:application/json X-Token:123456
```

Sample Response:
```json
{
    "characters": [
        {
            "characterID": 123456,
            "characterName": "ABC",
            "corporationID": 123456,
            "corporationName": "Garoun Investment Bank",
            "created_at": "2015-12-02 10:48:31",
            "id": 452,
            "keyID": 123456,
            "updated_at": "2015-12-02 10:48:31"
        }
    ],
    "created_at": "2015-12-29 13:37:47",
    "disabled_calls": null,
    "enabled": 1,
    "info": {
        "accessMask": 1073741823,
        "created_at": "2015-12-02 10:48:31",
        "expires": null,
        "keyID": 123456,
        "type": "Account",
        "updated_at": "2015-12-02 10:48:31"
    },
    "key_id": 123456,
    "last_error": null,
    "updated_at": "2016-01-06 04:53:05",
    "user_id": 10,
    "v_code": "pTySpi19ChY18jKbQdSmDoA9zStDkbv5MYJDHm0aKtypa2IwjIDOXVNp9tfSFPfu"
}
```

***

### Add an EVE API Key

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **POST** |
| Endpoint      | `/api/v1/key` |
| Description   | Add an EVE API key to the database. |
| Parameters    |  **key_id** - The keyID to add |
|     |  **v_code** - The vCode to add |
|     |  **user_id** - (optional) - The SeAT owner of the key. |

Sample Request:
```bash
http post http://localhost:8000/api/v1/key Accept:application/json X-Token:123456 \
    key_id=123 \
    v_code=JYKyPvIv75PN58UWcRcPHrtYKb4ySThFBk3n2qN4eaYGgCr1mrJbOwvQfHqNnf5k
```

Sample Response:
```json
[
    "ok"
]
```

Sample Error:
```
HTTP/1.1 400 Bad Request
Date: Thu, 16 Mar 2017 22:14:00 GMT
Status: 400 Bad Request
Content-Type: application/json
```
```json
[
  "msg": "This key already exist",
  "user_id": 1
]
```

***

### Edit an EVE API Key

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **PUT** |
| Endpoint      | `/api/v1/key/{key_id}` |
| Description   | Edit an EVE API key in the database. |
| Parameters    |  **key_id** - The keyID to update |
|     |  All other values are optional |

Sample Request:
```bash
# sets an api key to enabled for the eveapi updater
http put http://localhost:8000/api/v1/key/1234 Accept:application/json X-Token:123456 enabled=1
```

Sample Response:
```json
[
    "ok"
]
```

***

### Delete an EVE API Key

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **DELETE** |
| Endpoint      | `/api/v1/key/{key_id}` |
| Description   | Delete an EVE API key from the database. |
| Parameters    |  **key_id** - The keyID to delete |

Sample Request:
```bash
http delete http://localhost:8000/api/v1/key/1234 Accept:application/json X-Token:123456
```

Sample Response:
```json
[
    "ok"
]
```

***

### Transfer an EVE API Key

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/key/transfer/{key_id}/{user_id}` |
| Description   | Transfer ownership of an EVE API Key. |
| Parameters    |  **key_id** - The keyID to transfer |
|     |  **user_id** - he SeAT User id to get key ownership |

Sample Request:
```bash
http get http://localhost:8000/api/v1/key/transfer/123456/10 Accept:application/json X-Token:123456
```

Sample Response:
```json
[
    "ok"
]
```
