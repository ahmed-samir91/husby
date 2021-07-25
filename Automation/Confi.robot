*** Settings ***
Library     RequestsLibrary
Library         Collections
Library         httpLibrary
Resource            ../Automation/Common.robot


*** Keywords ***

connect node
    [Arguments]    ${pointA}  ${pointB}
    create session    connectnode    ${baseURL}
    ${API} =     catenate    ${connect_node}
    ${Params} =  create dictionary  from=${pointA}  to=${pointB}
    ${response} =    GET On Session    connectnode  ${API}   params=${Params}
    &{ResponseData} =  create dictionary  Body=${response.json()}      StatusCode=${response.status_code}
    Log   ${ResponseData}
    [Return]    ${ResponseData}

get path
    [Arguments]    ${pointA}  ${pointB}
#    ${Response}=   Session Exists  connectnode
#    Log   ${Response}
#    OPTIONS On Session    connectnode    ${baseURL}
    ${API} =     catenate    ${get_path}
    ${Params} =  create dictionary  from=${pointA}  to=${pointB}
    ${response} =  GET On Session    connectnode  ${API}   params=${Params}
    &{ResponseData} =  create dictionary   Body=${response.json()}      StatusCode=${response.status_code}
    Log   ${ResponseData}
    [Return]    ${ResponseData}