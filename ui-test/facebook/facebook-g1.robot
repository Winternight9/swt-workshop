*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Test Cases ***
Test Post On Facebook
    พิมพ์ facebook.com
    พิมพ์ username
    พิมพ์ password
    กด Enter
    เช็คชื่อผู้ใช้
    เลือกที่จะpost
    พิมพ์ข้อความ
    กดปุ่มpost
*** Keywords ***
พิมพ์ facebook.com    
    ${options}=    Evaluate  sys.modules['selenium.webdriver.chrome.options'].Options()    sys
    Call Method     ${options}    add_argument    --disable-notifications
    ${driver}=    Create Webdriver    Chrome    options=${options}
    Go To     https://facebook.com

พิมพ์ username
    Input Text    email    
    
พิมพ์ password
    Input Text    pass    

กด Enter
    Press Keys    pass    RETURN

เช็คชื่อผู้ใช้
    Page Should Contain    Supakorn Tangpremsri
เลือกที่จะpost
    Wait Until Page Contains    What's on your mind
    Click Element    xpath: //*[contains(text(), "What's on your mind, Supakorn?")]

พิมพ์ข้อความ
    Wait Until Page Contains    Add to Your Post
    Press Keys    none    สวัสดี Robot Framework
    
กดปุ่มpost
    Click Element    xpath://*[.="Post"]