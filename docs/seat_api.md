![SeAT](https://i.imgur.com/aPPOxSK.png)
## Introduction
SeAT has a RESTful API. Endpoints are protected by a access token that is limited by IP address.
For every IP address that wants to make API requests to SeAT, a unique token is required.  
API Tokens have no concept of ACL's. The API should primarily be used for integration with other systems.

## Definitions
Currently, all API endpoints live at `<seat url>/api/<version>` where `<seat url>` is the full url to your SeAT instance
and `<version>` is the API version you wish to interact with.

Since SeAT 3.0, it has been port to Swagger and its documentation is directly available from your instance at the
following address `<seat url>/api/documentation`.

## Authentication
Authentication to the SeAT API is done via a `X-Token` header.
A token may be obtained by browsing to the API settings page in the SeAT WebUI and generating one.
A sample request using `curl` with an authentication token can be seen below:

```bash
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

## Content-type
Make sure you specify the Accepted content-type header as `application/json`.
When using `cURL`, you can specify it with `-H`

Example:
```bash
$ curl -X POST https://seat.testsite.local/api/v1/key -H "Accept: application/json" -H "X-Token: L3SxgdX4XUw6pVWVSCftgsh16eAbBF3D" -d "key_id=123&v_code=123"
{"v_code":["The v code must be 64 characters."]}
```

If you don't do this, the API will respond with a redirect and not give you the expected content.

## Errors
All SeAT API responses will include the appropriate HTTP response codes. You should check this for error handling purposes. Some sample response codes could be:

| Code | Status | Description |
| ---- | ------ | ----------- |
| 200 | OK | The request was successful. |
| 404 | Not Found | The requested endpoint could not be found. |
| 422 | Unprocessable Entity | Typically, input validation has failed. The response json should contain the errors. |
| 500 | Internal Server Error | Something bad has happened. Check the server and Laravel log files for more details. |
