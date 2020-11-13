*** Settings ***
Library    SeleniumLibrary
Suite Teardown    Close All Browsers

*** Variables *** 
${URL}    https://dminer.in.th/Product-list.html
${Browser}    chrome
${Quantity}    4
*** Test Cases ***
user ซื้อของเล่นให้ลูกสาวเลือกวิธีจัดส่งเป็นkerry และชำระเงินด้วยบัตรเครดิต visa และชำระเงินสำเร็จ
    แสดงสินค้า
    แสดงรายละเอียดสินค้า
    ระบุจำนวนสั่งซื้อ
    นำสินค้าใส่ตระกร้า
    ยืนยันการสั่งซื้อและชำระเงินผ่านบัตรcredit-visa card
    ขอบคุณ

*** Keywords ***
แสดงสินค้า
    Open Browser    ${URL}    ${Browser}
    Element Should Contain    id=productName-1    expected=43 Piece Dinner Set
    Element Should Contain    id=productPrice-1    expected=12.95 USD
แสดงรายละเอียดสินค้า
    Click Button    viewMore-1   

ระบุจำนวนสั่งซื้อ
    Wait Until Page Contains    Add to Cart
    Element Should Contain    id=productName    expected=43 Piece dinner Set
    Element Should Contain    id=productBrand    expected=CoolKidz
    Element Should Contain    id=productPrice    expected=12.95 USD
    Input Text    productQuantity    ${Quantity}

นำสินค้าใส่ตระกร้า
    Click Button    addToCart

ยืนยันการสั่งซื้อและชำระเงินผ่านบัตรcredit-visa card
    Wait Until Page Contains    ยืนยันคำสั่งซื้อและชำระเงิน
    Element Should Contain    id=receiverName    expected=ณัฐญา ชุติบุตร
    Element Should Contain    id=recevierAddress   expected=405/37 ถ.มหิดล ต.ท่าศาลา อ.เมือง จ.เชียงใหม่ 50000
    Element Should Contain    id=recevierPhonenumber    expected=0970809292
    Element Should Contain    id=productName-1   expected=43 Piece dinner Set
    Element Should Contain    id=productPrice-1    expected=12.95 
    Element Attribute Value Should Be    id=productQuantity-1    attribute=Value    expected=1
    Click Button    confirmPayment
    Wait Until Page Contains    ยืนยันการชำระเงิน
    Input Text    cardNumber    4719700591590995
    Input Text    expiredMonth    7
    Input Text    expiredYear    20
    Input Text    cvv    752
    Input Text    cardName    Karnwat Wongudom
    Click Button    Payment

ขอบคุณ
    Wait Until Page Contains    กลับไปหน้าหลัก
    Element Should Contain    id=title    expected=ชำระเงินสำเร็จ
    Element Should Contain    id=notify    expected=วันเวลาที่ชำระเงิน 1/3/2563 13:30:00 หมายเลขคำสั่งซื้อ 8004359103 คุณสามารถติดตามสินค้าผ่านช่องทาง Kerry ด้วยหมายเลข 1785261900
 