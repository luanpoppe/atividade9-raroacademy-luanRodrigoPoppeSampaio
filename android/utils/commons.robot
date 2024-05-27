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

Swipe para esquerda X
    [Arguments]    ${valorXFinal}    ${valorY}=20    ${valorXInicial}=70
    Swipe By Percent    ${valorXInicial}    ${valorY}    ${valorXFinal}    ${valorY}

Swipe Y
    [Arguments]    ${valorYFinal}    ${valorX}=20    ${valorYInicial}=20
    Swipe By Percent    ${valorYInicial}    ${valorX}    ${valorYFinal}    ${valorX}