*** Settings ***
Library    AppiumLibrary
Library    XML
Resource    ../base.robot
*** Variables ***
${telaEmprestimo}    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View
${botaoVoltarEmprestimo}    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.Button[1]
${botaoAjudaEmprestimo}    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View[1]/android.widget.Button[2]
${tituloEmprestimo}    xpath=//android.view.View[contains(@content-desc, "O valor disponível no momento é de R$")]
${descricaoEmprestimo}    xpath=//android.view.View[@content-desc="Este valor pode mudar diariamente devido à nossa análise de crédito."]
${botaoEntendaComoFunciona}    xpath=//android.view.View[@content-desc="Entenda como funciona >"]
${botaoNovoEmprestimo}    xpath=//android.widget.Button[@content-desc="NOVO EMPRÉSTIMO"]
${mensagemNaoHaEmprestimos}    xpath=//android.view.View[@content-desc="Você não possui nenhum empréstimo ativo."]


*** Keywords ***

Quando clicar no botão de voltar da seção de empréstimo
    Aguardar para clicar no elemento    ${botaoVoltarEmprestimo}

Então deve ser possível ver as informações sobre empréstimo
    Wait Until Page Contains Element    ${telaEmprestimo}
    Wait Until Page Contains Element    ${botaoVoltarEmprestimo}
    Checar se elementos estão habilitados e visíveis    ${botaoVoltarEmprestimo}    ${botaoAjudaEmprestimo}    ${tituloEmprestimo}    ${descricaoEmprestimo}    ${botaoEntendaComoFunciona}
    Checar se elementos estão visíveis    ${botaoNovoEmprestimo}
Então deve ser possível ver a mensagem informando que o usuário não possui empréstimos
    Wait Until Page Contains Element    ${mensagemNaoHaEmprestimos}
    Checar se elementos estão visíveis    ${mensagemNaoHaEmprestimos}
