*** Settings ***
Library    AppiumLibrary
Library    XML
Resource    ../base.robot
*** Variables ***
${telaTransferir}        xpath=//android.widget.EditText

*** Keywords ***

Então deve ser possível ver as informações sobre a seção de transferir
    Wait Until Page Contains Element    ${telaTransferir}
    Page Should Contain Element    ${telaTransferir}
    ${hint}=    Get Element Attribute    ${telaTransferir}    hint
    Should Contain    ${hint}    Qual é o valor da transferência?\nSaldo disponível em conta R$

E digitar um valor a ser transferido
    Input Text    ${telaTransferir}    5560
    Wait Until Keyword Succeeds    4    1    Element Text Should Be    ${telaTransferir}    R$ 55,60