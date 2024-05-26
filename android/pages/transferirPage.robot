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

E tento digitar letras como valor a ser transferido
    Wait Until Page Contains Element    ${telaTransferir}
    Input Text    ${telaTransferir}    55abc60

Então as letras digitadas não devem ser consideradas para a transferência
    Wait Until Keyword Succeeds    4    1    Element Text Should Be    ${telaTransferir}    R$ 55,60

E tento digitar um valor com mais de 14 dígitos
    Wait Until Page Contains Element    ${telaTransferir}
    Input Text    ${telaTransferir}    12345678901234
    Input Text    ${telaTransferir}    5678

Então só os primeiros 14 dígitos serão mostrados no valor para transferência
    Wait Until Keyword Succeeds    4    1    Element Text Should Be    ${telaTransferir}    R$ 123.456.789.012,34