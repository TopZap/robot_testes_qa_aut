*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    XML
Library    String

*** Variables ***
&{home}    
...    url=https://qa.greenchat.com.br/
...    username_nao_cadastrado=qa@testes.com
...    username=datg2702@hotmail.com
...    password=123456
...    password_invalido=testandosenhainvalida
...    username_field=//input[@id="email"]
...    password_field=//input[@id="password"]
...    login_button=//button[@type="submit"]
...    success_msg=//button[contains(text(),"Atendimento")]
...    logout=//button[@aria-label='logout']
...    expected_url=https://qa.greenchat.com.br/
...    error_login=//span[normalize-space()='Erro ao fazer Login']
...    service_button=//button[@data-testid="side-bar-option-Atendimentos"]
...    service_select=//button[@class="selected"]
...    img_contact=//img[@class="contact-img"]
...    crm=//button[@data-testid="side-bar-option-CRM"]
...    filtros_crm=//p[normalize-space()='Filtros']
...    filtros_contatos_crm=//div[contains(@class,'sc-iSqusk hXWMqU css-b62m3t-container')]//div[contains(@class,'react-select__input-container css-19bb58m')]
...    atendimento_button=//button[@data-testid="side-bar-option-Atendimentos"]
...    all_button=//button[@class="all"]
...    filas_button=//button[contains(text(), "Filas")]
...    filas_label=//label[contains(text(), "Filas")]     
...    funil_crm=//button[normalize-space()='Funil de Oportunidades']     
...    img_contato_crm=(//div[@class='image'])[7]
...    atividades_crm=//strong[normalize-space()='Atividades']
...    imformacoes_gerais_crm=//strong[normalize-space()='Informações gerais']
...    menu_relatorios=//button[contains(@data-testid,'side-bar-option-Relatórios')]
...    modulo_tempo_medio=//span[normalize-space()='Tempo médio']
...    coluna_tempo_espera_atendimento=//th[normalize-space()='Tempo medio de espera por atendimento']
...    tempo_medio_horas=//*[@id="root"]/div[2]/div/main/div/div/div/div/div[1]/table/tbody/tr[1]/td[2]
...    testar_edição=(//p[@class='message'][normalize-space()='Testar edição'])[1]
...    menu_editar_msgs=//div[@class='message not_tail has_send']//button[@aria-label='menu']
...    editar_mensagens=//button[normalize-space()='Editar mensagem']
...    inserir_msg_edição=(//div[@class='ql-editor'])[1]
...    dashboard=//p[normalize-space()='Dashboard']
...    atendimento_simples=//p[normalize-space()='Atend. Simples']
...    contatos_menu=//section[@class='info']//p[contains(text(),'Contatos')]
...    contatos_page=//div[@class='sc-jHatCz sKRlK']//p[contains(text(),'Contatos')]
...    menu_campanhas=(//p[normalize-space()='Campanhas'])[1]
...    page_campanhas=//div[@class='sc-jHatCz sKRlK']//p[contains(text(),'Campanhas')]
...    menu_relatorios=//section[@class='info']//p[contains(text(),'Relatórios')]
...    page_relatorios=//div[@class='sc-jHatCz sKRlK']//p[contains(text(),'Relatórios')]    
...    menu_google_agenda=//p[normalize-space()='Google Agenda']
...    page_google_agenda=//div[@class='sc-jHatCz sKRlK']//p[contains(text(),'Google Agenda')]
...    menu_chat_shop=//section[@class='info']//p[contains(text(),'Chat Shop')]
...    page_chat_shop=//div[@class='sc-jHatCz sKRlK']//p[contains(text(),'Chat Shop')]
...    menu_pedidos=//p[normalize-space()='Pedidos']
...    page_pedidos=//div[@class='sc-jHatCz sKRlK']//p[contains(text(),'Pedidos')]
...    menu_administração=//p[normalize-space()='Administração']
...    page_administração=(//p[contains(text(),'Administração')])[2]
...    menu_configuração=//p[normalize-space()='Configurações']
...    page_configurações=//header[normalize-space()='Configurações']
        
*** Keywords ***
Abrir o Navegador e Acessar o Sistema
    Open Browser    ${home.url}    chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    3s

Realizar Login com Sucesso
    Wait Until Element Is Enabled    ${home.username_field}    30
    Input Text                       ${home.username_field}    ${home.username}
    Input Text                       ${home.password_field}    ${home.password}
    Click Button                     ${home.login_button}
    Wait Until Element Is Enabled    ${home.success_msg}    40
    ${current_url}=    Get Location
    Should Contain                   ${current_url}    dashboard
    # Capture Page Screenshot

Realizar Login com usuário não cadastrado
    Wait Until Element Is Enabled    ${home.username_field}    30
    Input Text                       ${home.username_field}    ${home.username_nao_cadastrado}
    Input Text                       ${home.password_field}    ${home.password}
    Click Button                     ${home.login_button}
    Wait Until Element Is Enabled    ${home.error_login}    30
    Set Focus To Element             ${home.error_login}
    ${Erro_Login}    Get Text    ${home.error_login}
    Log To Console    Validar mensagem de erro: ${Erro_Login}
    # Capture Page Screenshot

Login com senha inválida
    Wait Until Element Is Enabled    ${home.username_field}    30
    Input Text                       ${home.username_field}    ${home.username}
    Input Text                       ${home.password_field}    ${home.password_invalido}
    Click Button                     ${home.login_button}
    Wait Until Element Is Enabled    ${home.error_login}    30
    Set Focus To Element             ${home.error_login}
    ${Erro_Login}    Get Text    ${home.error_login}
    Log To Console    Validar mensagem de erro: ${Erro_Login}
    # Capture Page Screenshot

Realizar Logout com Sucesso
    Scroll Element Into View         ${home.logout}
    Wait Until Element Is Visible    ${home.logout}    60
    Click Button                     ${home.logout}
    Wait Until Location Is           ${home.expected_url}    30
    ${current_url}=    Get Location
    Should Be Equal As Strings       ${current_url}    ${home.expected_url}
    # Capture Page Screenshot

Validar imagem do usuário
    Wait Until Element Is Visible    ${home.service_button}    40
    Set Focus To Element             ${home.service_button}
    Click Button                     ${home.service_button}

    Wait Until Element Is Visible    ${home.service_select}    40
    Set Focus To Element             ${home.service_select}    
    Click Button                     ${home.service_select}

    # É necessário ter um usuário presente
    Wait Until Element Is Visible    ${home.img_contact}    40
    Set Focus To Element             ${home.img_contact}
    Click Image                      ${home.img_contact}
    # Capture Page Screenshot

Validar Filtros CRM
    Wait Until Element Is Visible    ${home.crm}    30
    Set Focus To Element             ${home.crm}
    Click Button                     ${home.crm}
    Set Focus To Element             ${home.filtros_crm}
    Wait Until Element Is Visible    ${home.filtros_crm}    30
    Click Element                    ${home.filtros_crm}
    Input Text                       ${home.filtros_contatos_crm}    988632111 

    # testar 

Filtrar por filas em Atendimentos    
    Wait Until Element Is Visible    ${home.atendimento_button}    30
    Set Focus To Element             ${home.atendimento_button}
    Click Button                     ${home.atendimento_button}
    # Não funciona sem o sleep
    Sleep    2
    Wait Until Element Is Visible    ${home.all_button}    30
    Set Focus To Element             ${home.all_button}
    Click Element                    ${home.all_button}
    
    Sleep    2
    Wait Until Element Is Visible    ${home.filas_button}    40
    Set Focus To Element             ${home.filas_button}
    Click Element                    ${home.filas_button}
    # Deverá apresentar apenas uma caixa de "Filas"
    Sleep    2
    Wait Until Element Is Visible    ${home.filas_label}    40
    Set Focus To Element             ${home.filas_label}
    Element Should Be Visible        ${home.filas_label}
    # Capture Page Screenshot

Validar informações do contato no CRM
    Wait Until Element Is Visible    ${home.crm}    40
    Set Focus To Element             ${home.crm}
    Click Element                    ${home.crm}
    
    Wait Until Element Is Visible    ${home.funil_crm}    40
    Set Focus To Element             ${home.funil_crm}
    Click Element                    ${home.funil_crm}
    # É necessário ter um usuário presente
    Wait Until Element Is Visible    ${home.img_contato_crm}    40
    Set Focus To Element             ${home.img_contato_crm}
    Click Element                    ${home.img_contato_crm}
    # Validar o campo "Atividades", validando que não está com tela branca
    Wait Until Element Is Visible    ${home.atividades_crm}    40
    Set Focus To Element             ${home.atividades_crm}
    Element Should Be Visible        ${home.atividades_crm}
     # Validar o campo "Informações", validando que não está com tela branca
    Wait Until Element Is Visible    ${home.imformacoes_gerais_crm}    40
    Set Focus To Element             ${home.imformacoes_gerais_crm}
    Element Should Be Visible        ${home.imformacoes_gerais_crm}
    # Capture Page Screenshot

Relatórios Tempo Médio
    # Acessar o menu "Relatótios"
    Wait Until Element Is Visible    ${home.menu_relatorios}    40
    Set Focus To Element             ${home.menu_relatorios}
    Click Element                    ${home.menu_relatorios}
    
    # Acessar o módulo "Tempo Médio"
    Wait Until Element Is Visible    ${home.modulo_tempo_medio}    40
    Set Focus To Element             ${home.modulo_tempo_medio}
    Click Element                    ${home.modulo_tempo_medio}

    # Validar a coluna "Tempo Médio de Espera por Atendimento"
    Wait Until Element Is Visible    ${home.coluna_tempo_espera_atendimento}    40
    Set Focus To Element             ${home.coluna_tempo_espera_atendimento} 
    
    # Validar com Screenshot que o formato do tempo está correto
    Wait Until Element Is Visible    ${home.tempo_medio_horas}    40
    Set Focus To Element             ${home.tempo_medio_horas}
    # Capture Page Screenshot

Edição de mensagens em atendimentos
    # Deverá ter uma mensagem com o texto "Testar edição"
    Wait Until Element Is Visible    ${home.testar_edição}    40
    Set Focus To Element             ${home.testar_edição}
    Click Element                    ${home.testar_edição}

    Wait Until Element Is Visible    ${home.menu_editar_msgs}    40
    Set Focus To Element             ${home.menu_editar_msgs}
    Click Element                    ${home.menu_editar_msgs}

    Wait Until Element Is Visible    ${home.editar_mensagens}    40
    Set Focus To Element             ${home.editar_mensagens}
    Click Element                    ${home.editar_mensagens}

    Wait Until Element Is Visible    ${home.inserir_msg_edição}    40
    Set Focus To Element             ${home.inserir_msg_edição}
    Clear Element Text               ${home.inserir_msg_edição}

    Input Text                       ${home.inserir_msg_edição}    Mensagem Editada    

Acessar Dashboard
    # Validar acesso ao Dashboard
    Wait Until Element Is Visible    ${home.dashboard}    40
    Set Focus To Element             ${home.dashboard}
    Click Element                    ${home.dashboard}

    Wait Until Element Is Enabled    ${home.success_msg}    40
    ${current_url}=    Get Location
    Should Contain                   ${current_url}    dashboard 
    
Acessar CRM
    # Validar acesso ao CRM
    Wait Until Element Is Visible    ${home.crm}    40
    Set Focus To Element             ${home.crm}
    Click Element                    ${home.crm}
    ${current_url}=    Get Location
    Should Contain                   ${current_url}    crm 

Acessar Atendimentos
    # Validar acesso ao Atendimentos
    Wait Until Element Is Visible    ${home.atendimento_button}    40
    Set Focus To Element             ${home.atendimento_button}
    Click Element                    ${home.atendimento_button}
    ${current_url}=    Get Location
    Should Contain                   ${current_url}    tickets

Acessar Atendimento Simples
    # Validar acesso à Atendimento Simples
    Wait Until Element Is Visible    ${home.atendimento_simples}    40
    Set Focus To Element             ${home.atendimento_simples}
    Click Element                    ${home.atendimento_simples}
    ${current_url}=    Get Location
    Should Contain                   ${current_url}    simple-tickets

Acessar Contatos
    # Validar acesso à Contatos
    Wait Until Element Is Visible    ${home.contatos_menu}    40
    Set Focus To Element             ${home.contatos_menu}
    Click Element                    ${home.contatos_menu}
    ${current_url}=    Get Location
    Should Contain                   ${current_url}    contacts

    Wait Until Element Is Visible    ${home.contatos_page}    40
    Set Focus To Element             ${home.contatos_page}
    Element Should Be Visible        ${home.contatos_page}

Acessar Campanhas
    # Validar acesso à Campanhas
    Wait Until Element Is Visible    ${home.menu_campanhas}    40
    Set Focus To Element             ${home.menu_campanhas}
    Click Element                    ${home.menu_campanhas}
    ${current_url}=    Get Location
    Should Contain                   ${current_url}    schedule

    Wait Until Element Is Visible    ${home.page_campanhas}    40
    Set Focus To Element             ${home.page_campanhas}
    Element Should Be Visible        ${home.page_campanhas}

Acessar Relatórios
    # Validar acesso à Relatórios
    Wait Until Element Is Visible    ${home.menu_relatorios}    40
    Set Focus To Element             ${home.menu_relatorios}
    Click Element                    ${home.menu_relatorios}
    ${current_url}=    Get Location
    Should Contain                   ${current_url}    reports

    Wait Until Element Is Visible    ${home.page_relatorios}    40
    Set Focus To Element             ${home.page_relatorios}
    Element Should Be Visible        ${home.page_relatorios}

Acessar Google Agenda
    # Validar acesso à Google Agenda
    Wait Until Element Is Visible    ${home.menu_google_agenda}    40
    Set Focus To Element             ${home.menu_google_agenda}
    Click Element                    ${home.menu_google_agenda}
    ${current_url}=    Get Location
    Should Contain                   ${current_url}    google_agenda

    Wait Until Element Is Visible    ${home.page_google_agenda}    40
    Set Focus To Element             ${home.page_google_agenda}
    Element Should Be Visible        ${home.page_google_agenda}

Acessar Chat Shop
    # Validar acesso à Chat Shop
    Wait Until Element Is Visible    ${home.menu_chat_shop}    40
    Set Focus To Element             ${home.menu_chat_shop}
    Click Element                    ${home.menu_chat_shop}
    ${current_url}=    Get Location
    Should Contain                   ${current_url}    shop_pedidos

    Wait Until Element Is Visible    ${home.page_chat_shop}    40
    Set Focus To Element             ${home.page_chat_shop}
    Element Should Be Visible        ${home.page_chat_shop}

Acessar Pedidos
    # Validar acesso à Pedidos
    Wait Until Element Is Visible    ${home.menu_pedidos}    40
    Set Focus To Element             ${home.menu_pedidos}
    Click Element                    ${home.menu_pedidos}
    ${current_url}=    Get Location
    Should Contain                   ${current_url}    chat_shop_ordered

    Wait Until Element Is Visible    ${home.page_pedidos}    40
    Set Focus To Element             ${home.page_pedidos}
    Element Should Be Visible        ${home.page_pedidos}

Acessar Administração
    # Validar acesso à Administração
    Wait Until Element Is Visible    ${home.menu_administração}    40
    Set Focus To Element             ${home.menu_administração}
    Click Element                    ${home.menu_administração}
    ${current_url}=    Get Location
    Should Contain                   ${current_url}    administration

    Wait Until Element Is Visible    ${home.page_administração}    40
    Set Focus To Element             ${home.page_administração}
    Element Should Be Visible        ${home.page_administração}

Acessar Configurações
    # Validar acesso à Configurações
    Wait Until Element Is Visible    ${home.menu_configuração}    40
    Set Focus To Element             ${home.menu_configuração}
    Click Element                    ${home.menu_configuração}  

    Wait Until Element Is Visible    ${home.page_configurações}    40
    Set Focus To Element             ${home.page_configurações}
    Element Should Be Visible        ${home.page_configurações}

Fechar o Navegador
    Close Browser