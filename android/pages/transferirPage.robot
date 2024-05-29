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
    
    O atributo do elemento deve conter texto    ${telaTransferir}    hint    Qual é o valor da transferência?\nSaldo disponível em conta R$
    AppiumLibrary.Element Text Should Be    ${telaTransferir}    R$ 0,00

E deve ser possível digitar um valor a ser transferido
    Input Text    ${telaTransferir}    5560
    Wait Until Keyword Succeeds    4    1    AppiumLibrary.Element Text Should Be    ${telaTransferir}    R$ 55,60

Quando tentar digitar letras como valor a ser transferido
    Wait Until Page Contains Element    ${telaTransferir}
    Input Text    ${telaTransferir}    55abc60

Então as letras digitadas não devem ser consideradas para a transferência
    Wait Until Keyword Succeeds    4    1    AppiumLibrary.Element Text Should Be    ${telaTransferir}    R$ 55,60

Quando tentar digitar um valor com mais de 14 dígitos
    Wait Until Page Contains Element    ${telaTransferir}
    Input Text    ${telaTransferir}    12345678901234
    Input Text    ${telaTransferir}    5678

Então só os primeiros 14 dígitos devem ser mostrados no valor para transferência
    Wait Until Keyword Succeeds    4    1    AppiumLibrary.Element Text Should Be    ${telaTransferir}    R$ 123.456.789.012,34