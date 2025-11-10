*** Settings ***
Resource    ../resources/pages/keywords/kw.resource
Resource    ../resources/pages/variables/var.resource

Test Setup        Abrir o Navegador e Acessar o Sistema
Test Teardown     Fechar o Navegador

*** Test Cases ***

TC001 - Acessar o menu lateral relatorios acessar crm e validar colunas
    [Documentation]    Testa o acesso ao menu "Relatórios"
    ...                Acessa o campo CRM e validar as colunas:
    ...                Oportunidade, Contato, Conexão, Usuários, Valor, Status,
    ...                Data de criação, data de finalização, origem e título do anúncio   
    [Tags]    menu    relatorios    crm    colunas
    Dado que esteja logado
    Quando acessar o menu relatórios
    E acessar à funcionalidade CRM em relatórios
    Então validar as colunas

TC002 - Validar formato em tempo medio
    [Documentation]    Testa o acesso ao menu "tempo medio"
    [Tags]    menu    tempo_medio
    Dado que esteja logado
    Então acessar Relatórios Tempo Médio