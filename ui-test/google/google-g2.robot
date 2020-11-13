*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.google.com 
${Browser}    chrome
${Keyword}    USElection2020
${Expected_Result}    US Election 2020 - BBC News
*** Test Cases ***
Test search keyword and verify search result on Google
    พิมพ์ google.com
    พิมพ์คำค้น 
    กด Enter
    ตรวจสอบผลการค้นหา



*** Keywords ***
พิมพ์ google.com
    Open Browser    ${URL}    ${Browser}

พิมพ์คำค้น 
    Input Text    q    ${Keyword}
    
กด Enter
    Press Keys    q    RETURN

ตรวจสอบผลการค้นหา
    Page Should Contain    ${Expected_Result}
    Close All Browsers