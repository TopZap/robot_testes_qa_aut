*** Settings ***
Resource    ../resources/pages/keywords/kw.resource
Resource    ../resources/pages/variables/var.resource

Test Setup        Abrir o Navegador e Acessar o Sistema
Suite Teardown    Fechar o Navegador

*** Test Cases ***
TC001 - Login com sucesso
    [Documentation]    Testa o login com usuário válido e logout
    [Tags]    login_sucesso    logout
    Dado que esteja logado
    Então realizo Logout com Sucesso

TC002 - Login com usuário não cadastrado
    [Documentation]    Testa o login com usuário não cadastrado
    ...                deverá ser visualizado a mensagem de erro 
    [Tags]    login_sem_sucesso    usuario_não_cadastrado
    Então ralizo Login com usuário não cadastrado

TC004 - Login com usuário cadastrado e senha inválida
    [Documentation]    Testa o login com usuário cadastrado mas com senha inválida
    ...                deverá ser visualizado a mensagem de erro 
    [Tags]    login_sem_sucesso    logout
     Então realizo login com senha inválida