*** Settings ***
Resource    ../resources/pages/keywords/kw.resource
Resource    ../resources/pages/variables/var.resource

Test Setup        Abrir o Navegador e Acessar o Sistema
Test Teardown     Fechar o Navegador

*** Test Cases ***
TC001 - Validar acesso a atendimentos
    [Documentation]    Testar que ao acessar o menu atendimentos > filtros > filas
    ...                deverá constar apenas uma caixa de seleção
    [Tags]    menu    atendimentos    
    Dado que esteja logado
    E acessar o menu atendimentos
    Então filtrar por filas
    
TC002 - Validar imagem do usuário
    [Documentation]    Testar que ao acessar o menu atendimentos
    ...                deverá ser visualizado o atendimento ao usuário "Douglas teste qa Gomes"
    [Tags]    menu    atendimentos
    Dado que esteja logado
    Então validar usuário em atendimento