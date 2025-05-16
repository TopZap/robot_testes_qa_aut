*** Settings ***
Resource    ../pages/home.robot
Suite Teardown    Fechar o Navegador

*** Test Cases ***

TC001 - Validar acesso a atendimentos
    Abrir o Navegador e Acessar o Sistema
    Realizar Login com Sucesso
    Acessar Atendimentos

TC002 - Validar caixa única "Filas"
    Abrir o Navegador e Acessar o Sistema
    Realizar Login com Sucesso
    Filtrar por filas em Atendimentos 
    
TC003 - Validar imagem do usuário
    Abrir o Navegador e Acessar o Sistema
    Realizar Login com Sucesso
    Validar imagem do usuário
    
TC010 - Validar mensagens anteriores
    Abrir o Navegador e Acessar o Sistema
    Realizar Login com Sucesso