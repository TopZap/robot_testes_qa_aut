*** Settings ***
Resource    ../resources/pages/keywords/kw.resource
Resource    ../resources/pages/variables/var.resource

Test Setup        Abrir o Navegador e Acessar o Sistema
Test Teardown     Fechar o Navegador

*** Test Cases ***

TC001 - Validar o módulo Inteligência Artifical_Histórico de pagamentos
    [Documentation]    Testa o acesso ao menu Inteligência Artifical > histórico de pagamentos
    ...                Testa o direcionamento para a url correta
    [Tags]    inteligencia_artificial    historico_pagamentos    
    Dado que esteja logado
    Quando acessar o menu administração
    E acesso IA histórico de pagamento

TC002 - Validar o módulo Inteligência Artifical_Histórico de uso
    [Documentation]    Testa o acesso ao menu Inteligência Artifical > histórico de uso
    ...                Testa o direcionamento para a url correta
    [Tags]    inteligencia_artificial    historico_uso    
    Dado que esteja logado
    Quando acessar o menu administração
    E acesso IA histórico de uso

TC003 - Validar o módulo Inteligência Artifical_Relatórios de erros
    [Documentation]    Testa o acesso ao menu Inteligência Artifical > relatórios de erros
    ...                Testa o direcionamento para a url correta
    [Tags]    inteligencia_artificial    relatorios_erros   
    Dado que esteja logado
    Quando acessar o menu administração
    E acesso IA relatorios de erros

TC004 - Validar o módulo Inteligência Artifical_Configurações
    [Documentation]    Testa o acesso ao menu Inteligência Artifical > configurações
    ...                Testa o direcionamento para a url correta
    [Tags]    inteligencia_artificial    configuracoes   
    Dado que esteja logado
    Quando acessar o menu administração
    E acesso IA configurações