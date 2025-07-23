*** Settings ***
Resource    ../resources/pages/keywords/kw.resource
Resource    ../resources/pages/variables/var.resource

Test Setup        Abrir o Navegador e Acessar o Sistema
Test Teardown     Fechar o Navegador

*** Test Cases ***

TC001 - Validar acessso à Relatórios
    [Documentation]    Testa o acesso ao menu "Relatórios"
    [Tags]    menu    relatorios
    Dado que esteja logado
    Quando acessar o menu relatórios

TC002 - Validar formato em tempo médio
    [Documentation]    Testa o acesso ao menu "tempo medio"
    [Tags]    menu    tempo_medio
    Dado que esteja logado
    Então acessar Relatórios Tempo Médio