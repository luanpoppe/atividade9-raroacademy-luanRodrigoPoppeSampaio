*** Settings ***
Library    AppiumLibrary
Library    XML
Resource    ../base.robot
*** Variables ***
${telaConta}        xpath=//android.widget.ScrollView
${textoSaldoDisponivel}    xpath=//android.view.View[@content-desc="Saldo disponível"]
${valorSaldoDisponivel}    xpath=//android.view.View[@content-desc="R$ 181,79"]
${buttonDinheiroGuardado}    xpath=//android.view.View[contains(@content-desc,"Dinheiro guardado")]
${buttonRendimentoTotalConta}    xpath=//android.view.View[contains(@content-desc,"Rendimento total da conta")]
${labelDepositar}    xpath=//android.view.View[@content-desc="Depositar"]
${buttonContaDepositar}    xpath=//android.widget.HorizontalScrollView/android.widget.Button[1]
${labelPagar}    xpath=//android.view.View[@content-desc="Pagar"]
${buttonContaPagar}    xpath=//android.widget.HorizontalScrollView/android.widget.Button[2]
${labelTransferir}    xpath=//android.view.View[@content-desc="Transferir"]
${buttonContaTransferir}    xpath=//android.widget.HorizontalScrollView/android.widget.Button[3]
${labelEmprestimos}    xpath=//android.view.View[@content-desc="Empréstimos"]
${buttonContaEmprestimos}    xpath=//android.widget.HorizontalScrollView/android.widget.Button[4]
${labelCobrar}    xpath=//android.view.View[@content-desc="Cobrar"]
${buttonContaCobrar}    xpath=//android.widget.HorizontalScrollView/android.widget.Button[5]
${tituloHistorico}    xpath=//android.view.View[@content-desc="Histórico"]
# ${historico1}    xpath=//android.view.View[contains(@content-desc,"Transferência enviadaOntem\nPA")]
${historico1}    xpath=//android.view.View[@content-desc="Transferência enviada\nOntem\nPATRICIA COSTA \nR$ 30,00\nPix"]
${historico2}    xpath=//android.view.View[@content-desc="Transferência recebida\nOntem\nANDRE JEY\nR$ 30,00\nPix"]
${historico3}    xpath=//android.view.View[@content-desc="Transferência recebida\nOntem\nERIKO BARBOSA\nR$ 30,00\nPix"]
${historico4}    xpath=//android.view.View[@content-desc="Transferência recebida\nOntem\nIVAN COELHO \nR$ 30,00\nPix"]
${buttonAjudaConta}    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.Button[2]
${buttonVoltarConta}    xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.Button[1]

*** Keywords ***
Quando clicar na funcionalidade para acessar a seção de depósitos
    Wait Until Keyword Succeeds    4    1    Aguardar para clicar no elemento    ${buttonContaDepositar}

Quando clicar na funcionalidade para acessar a seção de pagamentos
    Wait Until Keyword Succeeds    4    1    Aguardar para clicar no elemento    ${buttonContaPagar}
Quando clicar na funcionalidade para acessar a seção de transferências
    Wait Until Keyword Succeeds    4    1    Aguardar para clicar no elemento    ${buttonContaTransferir}
Quando clicar na funcionalidade para acessar a seção de empréstimos
    Wait Until Keyword Succeeds    4    1    Aguardar para clicar no elemento    ${buttonContaEmprestimos}
Quando clicar na funcionalidade para acessar a seção de cobranças
    Wait Until Keyword Succeeds    4    1    Aguardar para clicar no elemento    ${buttonContaCobrar}
Quando clicar na opção de retornar da seção de conta
    Aguardar para clicar no elemento    ${buttonVoltarConta}

E clicar na funcionalidade de conta
    Aguardar para clicar no elemento    ${botaoConta}

Então usuário deve poder acessar informações sobre sua conta
    Wait Until Page Contains Element    ${telaConta}
    Wait Until Page Contains Element    ${textoSaldoDisponivel}
    Checar se elementos estão visíveis    ${textoSaldoDisponivel}    ${valorSaldoDisponivel}    ${labelDepositar}    ${labelPagar}    ${labelTransferir}    ${labelEmprestimos}    ${labelCobrar}    ${tituloHistorico}    ${buttonAjudaConta}    ${historico1}
    Checar se elementos estão habilitados e visíveis    ${buttonDinheiroGuardado}    ${buttonRendimentoTotalConta}    ${buttonContaDepositar}    ${buttonContaPagar}    ${buttonContaTransferir}    ${buttonContaEmprestimos}    ${buttonContaCobrar}    ${buttonVoltarConta}
    Swipe para cima Y
    Checar se elementos estão visíveis    ${historico2}    ${historico3}    ${historico4}