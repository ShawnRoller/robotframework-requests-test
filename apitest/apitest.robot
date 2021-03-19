*** Settings ***
Library               Collections
Library               RequestsLibrary

Suite Setup           Create Session    qa1         https://qa1-retail-api.techstyle.tech/

*** Test Cases ***

Get Request Test
    Create Session    google             http://www.google.com

    ${resp_google}=   GET On Session     google             /           expected_status=200
    ${resp_json}=     GET On Session     qa1                /uptime

    Should Be Equal As Strings           ${resp_google.reason}    OK
    Dictionary Should Contain Value      ${resp_json.json()}    sunt aut facere repellat provident occaecati excepturi optio reprehenderit

Post Request Test
    &{data}=          Create dictionary  title=Robotframework requests  body=This is a test!  userId=1
    ${resp}=          POST On Session    qa1                /posts    json=${data}
    
    Status Should Be                     201    ${resp}
    Dictionary Should Contain Key        ${resp.json()}     id