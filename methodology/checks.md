
# Checks

## This is a list of checks to be made in order to ensure that the request gets through all the tests

## Primary checks

### 1. Challenge / edge cookie validity (Akamai _abck / bm_*)

### 2. TLS ClientHello / JA3 fingerprint mismatch 

### 3. Missing/incorrect ALPN or HTTP/2 / Brotli support

### 4. Header inconsistencies / missing browser metadata (Sec-Fetch-*, CH hints)

### 5. Request flow / referrer chain missing (calling API directly)

## Secondary checks

### 1. IP reputation / datacenter vs residential / VPN 

### 2. Rate limiting or parallel requests from same client/IP 

### 3. Authentication / authorization header or payload shape unexpected 

### 4. Browser fingerprint / JS feature mismatch (navigator, canvas, webdriver) 

### 5. Replay / reuse of tokens across IPs or sessions 

