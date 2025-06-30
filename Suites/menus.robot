*** Settings ***
Resource    ../resources/pages/keywords/kw.resource
Resource    ../resources/pages/variables/var.resource

Test Setup        Abrir o Navegador e Acessar o Sistema
Suite Teardown    Fechar o Navegador

*** Test Cases ***

TC001 - Validar acesso à dashboard
    [Documentation]    Testa o acesso ao menu "Dashboard"
    [Tags]    menu    dashboard  
    Dado que esteja logado
    Quando acessar o menu Dashboard

TC002 - Validar acesso à Atendimento Simples
    [Documentation]    Testa o acesso ao menu "Atendimento"
    [Tags]    menu    atendimento
    Dado que esteja logado
    Quando acessar o menu atendimento simples

TC003 - Validar acesso à Contatos
    [Documentation]    Testa o acesso ao menu "Contatos"
    [Tags]    menu    contatos
    Dado que esteja logado
    Quando acessar o menu contatos

TC004 - Validar acesso à Campanhas
    [Documentation]    Testa o acesso ao menu "Campanhas"
    [Tags]    menu    campanhas
    Dado que esteja logado
    Quando acessar o menu campanhas

TC005 - Validar acessso à Google Agenda
    [Documentation]    Testa o acesso ao menu "Google Agenda"
    [Tags]    menu    google_agenda
    Dado que esteja logado
    Quando acessar o menu Google Agenda

TC006 - Validar acesso à Chat Shop
    [Documentation]    Testa o acesso ao menu "Chat Shop"
    [Tags]    menu    chat_shop
    Dado que esteja logado
    Quando acessar o menu chat shop

TC007 - Validar acessso à Pedidos
    [Documentation]    Testa o acesso ao menu "Pedidos"
    [Tags]    menu    pedidos
    Dado que esteja logado
    Quando acessar o menu podidos

TC008 - Validar acesso à Administração
    [Documentation]    Testa o acesso ao menu "Administração"
    [Tags]    menu    administracao
    Dado que esteja logado
    Quando acessar o menu administração

TC009 - Validar acesso à Configurações
    [Documentation]    Testa o acesso ao menu "Configurações"
    [Tags]    menu    configuracoes
    Dado que esteja logado
    Quando acessar o menu configuracões