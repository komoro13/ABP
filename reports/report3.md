# Report 3

### We see that the request works in Powershell when using httpClientRequest
### but it doesnt worth with Invoke-HttpRequest

### That shows that the antibot does not like the chunked format used by 
### Invoke-HttpRequest

### We also see that since the request works through both curl and powershell
### the anti-bot does not do any JA3 test as the fingerprint of curl and powershell
### would be different from that of a browser

### Also we see that the request works without the cookie parameter
### so the anti-bot does not check the cookies either

### The same request works also from different client IP Addresses
### so there is nothing IP sensitive in the request as well