*** Settings ***
Documentation  Automate API response for Pet stores
Library  RequestsLibrary
Library  JSONLibrary
Library  BuiltIn
Library  Collections


*** Test Cases ***
Get Pet by status available
  [Documentation]  test should find pet by status
   Create Session    My session    https://petstore.swagger.io/v2  verify=true
   ${responses}=  GET On Session   My session  /pet/findByStatus?  params=status=available
   Status Should Be    200   ${responses}

Get Pet by status pending
  [Documentation]  test should find pet by status
   Create Session    My session    https://petstore.swagger.io/v2  verify=true
   ${responses}=  GET On Session   My session  /pet/findByStatus?  params=status=pending
   Status Should Be    200   ${responses}

Get Pet by status sold
  [Documentation]  test should find pet by status
   Create Session    My session    https://petstore.swagger.io/v2  verify=true
   ${responses}=  GET On Session   My session  /pet/findByStatus?  params=status=sold
   Status Should Be    200   ${responses}

Create a pet in pet stores
   [Documentation]  test should find pet by status
    ${body}=  Create Dictionary  id=0  name=monkey  status=available
     ${responses}=  POST   https://petstore.swagger.io/v2/pet  json=${body}
     Log To Console    ${responses}
     Status Should Be    200   ${responses}

Update a pet
   [Tags]  lol
   [Documentation]  test should find pet by status
    ${body}=  Create Dictionary  id=9223372000001090101  name=dog  status=available
     ${responses}=  PUT   https://petstore.swagger.io/v2/pet  json=${body}
     Log To Console    ${responses}
     Status Should Be    200   ${responses}

Delete a pet
   [Tags]  lol
  [Documentation]  test should find pet by status
   #Create Session    My session    https://petstore.swagger.io/v2  verify=true
   ${responses}=  DELETE   https://petstore.swagger.io/v2/pet/9223372000001090101
   Status Should Be    200   ${responses}







*** Keywords ***