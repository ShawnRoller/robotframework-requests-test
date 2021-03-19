*** Settings ***
Library               Collections
Library               RequestsLibrary

Suite Setup           Create Session    qa1         https://qa1-retail-api.techstyle.tech

*** Test Cases ***

Get Request Test
    ${resp_qa1}=     GET On Session     qa1                /uptime     expected_status=200

    Should Be Equal As Strings           ${resp_qa1.reason}    OK



# Post Requests with Json Data
#     ${data}=    Create Dictionary   latitude=30.496346  longitude=-87.640356
#     ${resp}=     Post On Session    qa1     /uptime    json=${data}
#     Should Be Equal As Strings  ${resp.status_code}  200
#     ${jsondata}=  Set Variable  ${resp.json()}
#     Should Be Equal As Strings     ${jsondata['method']}   POST
#     Should Be Equal     ${jsondata['json']}     ${data}
