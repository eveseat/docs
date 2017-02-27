![SeAT](http://i.imgur.com/aPPOxSK.png)

# SeAT Roles, Permissions and Authorization

All endpoints in this document are for version1 (`/api/v1`) of the SeAT API.  
All methods below have the requests and responses sampled using [httpie](https://github.com/jkbrzt/httpie).

# Available Methods
* [List All](#list-all-groups)
* [Show Detail](#show-group-detail)

***

### List all Groups

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/groups/` |
| Description   | List all recorded Groups from the database. |

Sample Request:
```bash
http get http://localhost:8000/api/v1/groups/ Accept:application/json X-Token:123456
```

Sample Response:
```json
[
    {
        "created_at": "2016-11-01 10:24:05",
        "id": 1,
        "main_character_id": 123456,
        "main_character_name": "CharacterName",
        "updated_at": "2016-11-01 10:24:05"
    }
]
```

***

### Show Group Detail

| Type          | Detail  |
| ------------- |--------|
| HTTP Verb     | **GET** |
| Endpoint      | `/api/v1/groups/{group_id}` |
| Description   | Get details for a single SeAT Group. Shows People with the API Key and Characters on Key. |
| Parameters    |  **group_id** - The group id for the Group. |

Sample Request:
```bash
http get http://localhost:8000/api/v1/groups/1 Accept:application/json X-Token:123456
```

Sample Response:
```json
{
    "created_at": "2016-11-14 08:48:53",
    "id": 1,
    "main_character_id": 123445,
    "main_character_name": "Some Character",
    "members": [
        {
            "characters": [
                {
                    "characterID": 123445,
                    "characterName": "Some Character",
                    "corporationID": 12333,
                    "corporationName": "Some Corporation",
                    "created_at": "2016-11-11 20:46:40",
                    "id": 813,
                    "keyID": 5694884,
                    "updated_at": "2016-11-11 21:05:54"
                },
                {
                    "characterID": 12345,
                    "characterName": "Some Character",
                    "corporationID": 12333,
                    "corporationName": "Some Corporation",
                    "created_at": "2016-11-24 16:01:37",
                    "id": 862,
                    "keyID": 5694884,
                    "updated_at": "2016-11-30 19:01:50"
                }
            ]
        }
    ]
}
```

***
