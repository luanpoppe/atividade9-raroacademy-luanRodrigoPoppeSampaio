*** Settings ***

Resource    ../base.robot

*** Keywords ***

Espera o elemento para clicar
    [Arguments]    ${elemento}
    Wait Until Element Is Visible    ${elemento}
    Click Element                    ${elemento}

Espera o elemento para fazer o inputtext
    [Arguments]    ${elemento}    ${texto}
    Wait Until Element Is Visible    ${elemento}
    Input Text                       ${elemento}    ${texto}

Get Element Content Desc
    [Arguments]    ${elemento}
    ${texto}=    Get Element Attribute    ${elemento}    content-desc
    RETURN    ${texto}