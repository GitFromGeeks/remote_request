
A flutter package for remote network request

## Features

Remote Network Request  will response from API with any operation i,e CRUD
    1.Create,
    2.Read,
    3.Update,
    4.Delete,
    5.Put,
    6.Patch

In future about to add few more operations that will allow calling the APIs also the fromMap or toMap conversion in it.

## Getting started

Just need to call Request Class to having CRUD operation

## Usage

Request Class all all the features required, 
But ** Do not forget to initialize the BaseURL and Auth token the interceptors

You can through exceptions also 

```dart
var response = await Request.get(
          "ENDPOINT/get/");
try{
if (response != null && response.statusCode == 200) {
        if (jsonData["status"] == 200) {
          for (var temp in jsonData["data"]) {
            log("Case : $temp");
            cases.add(CaseModel.fromMap(temp));
          }
        } else {
          throw await Request.throwExceptionFromStatusCode(jsonData["status"]);
        }
      }
} on DioException catch (e) {
      log(e.toString());
      throw await Request.throwException(e);
    }
```

## Additional information

This package under the hood uses Dio and Dio interceptor to call APIs
