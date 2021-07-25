*** Settings ***
Library         RequestsLibrary
Library         DebugUiLibrary
Library         httpLibrary
Library         SeleniumLibrary
Library         FakerLibrary
Resource            ../Automation/Common.robot
Library         RequestsLibrary
Library         SeleniumLibrary
Resource            ../Automation/Confi.robot

*** Variables ***
${point_A}=  A
${point_B}=  B
${point_C}=  C

*** Test Cases ***
Test connect nodes
    ${Response} =  run keyword   connect node  ${point_A}  ${point_B}
    run keyword and continue on failure   Assert Response Body Contains Exact Value   ${Response.Body['message']}   connected success
    run keyword and continue on failure   Assert Status Code Is Correct   ${Response.StatusCode}   200

Test get path between the first 2 points
    ${Response} =  run keyword   connect node  ${point_A}  ${point_B}
    ${Response} =  run keyword   get path  ${point_A}  ${point_B}
    run keyword and continue on failure   Assert Response Body Contains Exact Value   ${Response.Body['shortest-path']}   ['A', 'B']
    run keyword and continue on failure   Assert Status Code Is Correct   ${Response.StatusCode}   200

Test get the shortest path between 3 points
    ${Response} =  run keyword   connect node  ${point_A}  ${point_B}
    ${Response} =  run keyword   connect node  ${point_B}  ${point_C}
    ${Response} =  run keyword   get path  ${point_A}  ${point_C}
    run keyword and continue on failure   Assert Response Body Contains Exact Value   ${Response.Body['shortest-path']}   ['A', 'B', 'C']
    run keyword and continue on failure   Assert Status Code Is Correct   ${Response.StatusCode}   200

Test get path between the last 2 points
    ${Response} =  run keyword   connect node  ${point_A}  ${point_C}
    ${Response} =  run keyword   get path  ${point_A}  ${point_C}
    run keyword and continue on failure   Assert Response Body Contains Exact Value   ${Response.Body['shortest-path']}   ['A', 'C']
    run keyword and continue on failure   Assert Status Code Is Correct   ${Response.StatusCode}   200