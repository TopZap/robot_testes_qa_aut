*** Settings ***
Resource    ../resources/pages/keywords/kw.resource
Resource    ../resources/pages/variables/var.resource

Test Setup        Abrir o Navegador e Acessar o Sistema
Test Teardown     Fechar o Navegador

*** Test Cases ***

TC001 - Validar acesso ao CRM | Tela branca
    [Documentation]    Testa o acesso ao menu "CRM"
    ...                Testa o acesso ao funil e ao usuário cadastrado
    ...                ao clicar no usuário, validar suas informações e que não há tela branca
    [Tags]    menu    crm 
    Dado que esteja logado
    Então validar informações do contato no CRM

TC002 - Carrossel de informações
    [Documentation]    Testa o carrossel de informações no CRM
    ...    O usuário "Douglas teste qa" deverá estar presente no CRM 
    ...    e ter pelo menos 4 informações cadastradas
    [Tags]    crm    carrossel 
    Dado que esteja logado
    Então validar informações do contato no CRM
    E validar carrossel