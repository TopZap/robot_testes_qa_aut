*** Settings ***
Resource    ../resources/pages/keywords/kw.resource
Resource    ../resources/pages/variables/var.resource

Test Setup        Abrir o Navegador e Acessar o Sistema
Test Teardown     Fechar o Navegador

*** Test Cases ***

TC001 - Valida contextos personalizados
    [Documentation]    Testa o acesso ao menu "Configurações"
    ...                Testa contextos personalizados
    [Tags]    menu    configuracoes    contextos_personalizados
    Dado que esteja logado
    Quando acessar o menu configuracões
    E acessar a aba contexto do menu configurações
    Então lançar contexto Personalizado