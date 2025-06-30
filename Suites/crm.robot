*** Settings ***
Resource    ../resources/pages/keywords/kw.resource
Resource    ../resources/pages/variables/var.resource

Test Setup        Abrir o Navegador e Acessar o Sistema
Suite Teardown    Fechar o Navegador

*** Test Cases ***

TC001 - Validar acesso ao CRM
    [Documentation]    Testa o acesso ao menu "CRM"
    ...                Testa o acesso ao funil e ao usuário cadastrado
    ...    ao clicar no usuário, valida suas informações e que não há tela branca
    [Tags]    menu    crm 
    Dado que esteja logado
    Então validar informações do contato no CRM