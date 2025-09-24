# Steps taken to solve the problem

## Step 1

### Searched a flight through the official page: delta.com
### and captured all the requests using web-tools 
### Filters used: Document 

## Step 2

### Filters returned two html documents
### Only two of them seemed interesting
### These two documents are dumped
### and stored in the dumps directory

## Step 3

### Searched in both of the documents and
### found the API url: https://offer-api-prd.delta.com/

## Step 4

### Went back to Web-Tools and set the
### api url as a filter along with
### Fetch/XHR
### It returned an XHR request: rm-offer-gql

## Step 5

### Analyzed the the request and tried to reproduced it
### using both curl in Linux and Powershell
### By setting the same body