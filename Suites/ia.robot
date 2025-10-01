*** Settings ***
Resource    ../resources/pages/keywords/kw.resource
Resource    ../resources/pages/variables/var.resource

Test Setup        Abrir o Navegador e Acessar o Sistema

Test Teardown     Fechar o Navegador

*** Test Cases ***

TC001 - Criar agentes de IA
    [Documentation]    Testa o acesso ao menu Inteligência Artifical > histórico de pagamentos
    ...                Testa o direcionamento para a url correta
    [Tags]    inteligencia_artificial    historico_pagamentos    
    Dado que esteja logado
    Quando acessar o menu administração
    Quando acessar Agentes de IA
    Quando criar agentes de ia
    E editar agentes de IA
    E editar base de conhecimento | agentes de IA
    Então testar o Agente de IA 


TC002 - Validar criação de plano por IA
    [Documentation]    Testa o acesso com Super Admin > Planos > Adicionar Plano > IA
    ...                Validar que o plano foi criado > Deletar plano
    [Tags]    inteligencia_artificial    adicionar_plano  
    Dado que esteja logado Admin
    Quando acessar o menu planos
    E clicar em adicionar plano
    Então criar e validar plano por IA