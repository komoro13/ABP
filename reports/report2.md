# Report 2


### The linux curl script that can be found in
### /scripts/request_bash.sh works fine
### and the response is the JSON with all the 
### available prices

## Headers that when removed or changed return error response

### authorization: GUEST 
### When this header is removed the response is: {"message":"Unauthorized"}  

### application: DC
### When removed returns: 

### {"errors":[{"message":"RetailOfferError","locations":[],"extensions":{"errors":{"code":"ROF5003",### "message":"System Error","developerMessage":"Required request header 'applicationId' for method ### parameter type String is not present","moreInfo":[]},"httpStatusCode":500}}],"data": "gqlSearchOffers":null} 

### 'channelid: DCOM'
### {"errors":[{"message":"RetailOfferError","locations":[],"extensions":{"errors":{"code":"ROF5003","message":"System Error","developerMessage":"Required request header 'channelId' for method parameter type String is not present","moreInfo":[]},"httpStatusCode":500}}],"data":{"gqlSearchOffers":null}} 

### <HTML><HEAD>
### <TITLE>Access Denied</TITLE>
### </HEAD><BODY>
### <H1>Access Denied</H1>
 
### 'referer: https://www.delta.com/' 
### You don't have permission to access this server.<P>
### Reference 0.8e463917.1758602801.2df6ef03
### </BODY>
### </HTML>

### <HTML><HEAD>
### <TITLE>Access Denied</TITLE>
### </HEAD><BODY>
### <H1>Access Denied</H1>

### sec-ch-ua: "Chromium";v="140", "Not=A?Brand";v="24", "Google Chrome";v="140"
### You don't have permission to access this server.<P>
### Reference 0.8fca2c17.1758602985.2249481c
### </BODY>
### </HTML>

### <HTML><HEAD>
### <TITLE>Access Denied</TITLE>
### </HEAD><BODY>
### <H1>Access Denied</H1>
 
### sec-ch-ua-mobile: ?0 
### You don't have permission to access this server.<P>
### Reference 0.8fca2c17.1758603129.224b30ab
### </BODY>
### </HTML>  

### sec-ch-ua-platform: "Windows"
### <HTML><HEAD>
### <TITLE>Access Denied</TITLE>
### </HEAD><BODY>
### <H1>Access Denied</H1>
 
### You don't have permission to access this server.<P>
### Reference 0.8fca2c17.1758603207.224c196f
### </BODY>
### </HTML>

### sec-fetch-dest: empty
### <HTML><HEAD>
### <TITLE>Access Denied</TITLE>
### </HEAD><BODY>
### <H1>Access Denied</H1>
 
### You don't have permission to access this server.<P>
### Reference 0.85ca2c17.1758603287.285d9d34
### </BODY>
### </HTML>

### transactionid: 5ae0375f-e4f4-4e60-92f6-5815d72aa711_1758503123068
### {"errors":[{"message":"RetailOfferError","locations":[],"extensions":{"errors":{"code":"ROF5003","message":"System Error","developerMessage":"Required request header 'transactionId' for method parameter type String is not present","moreInfo":[]},"httpStatusCode":500}}],"data":{"gqlSearchOffers":null}}

### <HTML><HEAD>
### <TITLE>Access Denied</TITLE>
### </HEAD><BODY>
### <H1>Access Denied</H1>
 
### You don't have permission to access this server.<P>
### Reference 0.85ca2c17.1758603539.2860c062
### </BODY>
### </HTML>   

###  accept: application/json, text/plain, */*
### <HTML><HEAD>
### <TITLE>Access Denied</TITLE>
### </HEAD><BODY>
### <H1>Access Denied</H1>
 
### You don't have permission to access this server.<P>
### Reference 0.c4292117.1758603610.3336d413
### </BODY>
### </HTML>     

### 'accept-language: en-GB,en;q=0.9,el-GR;q=0.8,el;q=0.7,en-US;q=0.6'
### <HTML><HEAD>
### <TITLE>Access Denied</TITLE>
### </HEAD><BODY>
### <H1>Access Denied</H1>
 
### You don't have permission to access this server.<P>
### Reference 0.85ca2c17.1758603711.286338af
### </BODY>
### </HTML>  

### A request with only the required parameters returns the the JSON NORMALLY

