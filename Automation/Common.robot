*** Settings ***
Library         RequestsLibrary
Library         Collections

*** Variables ***
${baseURL} =  http://192.168.1.12:105/
${connect_node} =  connect_node
${get_path} =  get_shortest_path
*** Keywords ***
Assert Status Code Is Correct
    [Arguments]         ${ActualStatusCode}      ${ExpectedStatusCode}
    should be equal    '${ActualStatusCode}'      '${ExpectedStatusCode}'

Assert Response Body Contains Exact Value
    [Arguments]    ${ResponseBodyWithKey}  ${ExpectedValue}
    should be equal    '${ResponseBodyWithKey}'   '${ExpectedValue}'

Assert Response Body Contains Value
    [Arguments]    ${ResponseBodyWithKey}  ${ExpectedValue}
    should contain    '${ResponseBodyWithKey}'   '${ExpectedValue}'
