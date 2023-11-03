![SeAT](https://i.imgur.com/aPPOxSK.png)

# Introduction

SeAT has a REST API. Endpoints are protected by an access token that is limited by IP address. For every IP address that wants to make API requests to SeAT, a unique token is required. API Tokens have no concept of ACL's. The API should primarily be used for integrations with other systems.

## Definitions

Currently, all API endpoints live at `<seat url>/api/<version>` where `<seat url>` is the full url to your SeAT instance and `<version>` is the API version you wish to interact with.

Since SeAT 3.0, API documentation is generated from source code annotations and presented via a Swagger UI. As a result, endpoint documentation is now directly available on your instance at the following address `<seat url>/api/documentation`. A link to the documentation is also provided on the API key management page available to users with the Superuser role.

!!! warning "Swagger JSON"
    If you get an error when viewing the API documentation that complains about a file called `api-docs.json`, make sure that you ran the `php artisan l5-swagger:generate` command as part of the installation and upgrade routines.

## Authentication

Authentication to the SeAT API is done via a `X-Token` header. A token may be obtained by browsing to the API settings page in the SeAT WebUI and generating one. A sample request using `curl` with an authentication token can be seen below:

```bash linenums="1"
$ curl -X GET -H "X-Token:123456" -H "Accept: application/json" http://localhost:8000/api/v1/key
*   Trying ::1...
* Connected to localhost (::1) port 8000 (#0)
> GET /api/v1/key HTTP/1.1
> Host: localhost:8000
> User-Agent: curl/7.43.0
> Accept: application/json
> X-Token:123456
>
< HTTP/1.1 200 OK
< Host: localhost:8000
< Connection: close
< Cache-Control: no-cache
< Date: Sat, 28 Nov 2015 22:27:12 GMT
< Content-Type: application/json
```

## Content-Type

Make sure you specify the Accepted content-type header as `application/json`. When using `cURL`, you can specify it with `-H`

Example:

```bash linenums="1"
$ curl -X POST https://seat.testsite.local/api/v1/key -H "Accept: application/json" -H "X-Token: L3SxgdX4XUw6pVWVSCftgsh16eAbBF3D" -d "key_id=123&v_code=123"
{"v_code":["The v code must be 64 characters."]}
```

If you don't do this, the API will respond with a redirect and not give you the expected content.

## Errors

All SeAT API responses will include the appropriate HTTP response codes. You should check this for error handling purposes. Some sample response codes could be:

| Code | Status                | Description                                                                          |
|------|-----------------------|--------------------------------------------------------------------------------------|
| 200  | OK                    | The request was successful.                                                          |
| 404  | Not Found             | The requested endpoint could not be found.                                           |
| 422  | Unprocessable Entity  | Typically, input validation has failed. The response json should contain the errors. |
| 500  | Internal Server Error | Something bad has happened. Check the server and Laravel log files for more details. |
