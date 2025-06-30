*** Settings ***
Resource    ../resources/pages/keywords/kw.resource
Resource    ../resources/pages/variables/var.resource

Test Setup        Abrir o Navegador e Acessar o Sistema
Suite Teardown    Fechar o Navegador

*** Test Cases ***

TC001 - Parametrizar grupo de permissôes
    [Documentation]    Testa a parametrização de um usuário específico "teste douglas qa"
    ...                Ao selecionar o menu "Páginas" e vincular ao módulo "Contatos"
    ...                O usuário deverá ter acesso apenas a esse módulo
    [Tags]    menu    administracao
    Dado que esteja logado
    Quando acessar o menu administração
    E acessar o módulo grupo de permissões
    Então selecionar o modal contatos
    Então realizo Logout com Sucesso
    Quando estiver logado com usuário teste
    Então visualizar apenas o modal contatos