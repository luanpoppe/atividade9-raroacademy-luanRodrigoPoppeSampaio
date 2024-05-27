*** Settings ***

Library    AppiumLibrary

Resource    utils/config.robot
Resource    utils/commons.robot

# Pages
Resource    pages/paginaInicialPage.robot
Resource    pages/indicacaoAmigosPage.robot
Resource    pages/pixPage.robot
Resource    pages/pagarPage.robot
Resource    pages/transferirPage.robot
Resource    pages/depositarPage.robot
Resource    pages/emprestimoPage.robot
Resource    pages/recargaCelularPage.robot
Resource    pages/cobrarPage.robot
Resource    pages/cartaoCreditoPage.robot
Resource    pages/investimentosPage.robot

# Features:
# Resource    features/paginaInicial.robot