*** Settings ***
Resource    ../pages/home.robot
Suite Teardown    Fechar o Navegador

*** Test Cases ***
TC001 - Login com sucesso
    Abrir o Navegador e Acessar o Sistema
    Realizar Login com Sucesso
    Realizar Logout com Sucesso   

TC002 - Login com usuário não cadastrado
    Abrir o Navegador e Acessar o Sistema
    Realizar Login com usuário não cadastrado

TC004 - Login com usuário cadastrado e senha inválida
    Abrir o Navegador e Acessar o Sistema
    Login com senha inválida