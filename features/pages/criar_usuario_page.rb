class User < SitePrism::Page
    set_url '/users/new'
    element :nome, '#user_name'
    element :ultimo_nome, '#user_lastname'
    element :email, '#user_email'
    element :endereco, '#user_address'
    element :universidade, '#user_university'
    element :profissao, '#user_profile'
    element :genero, '#user_gender'
    element :idade, '#user_age'
    element :botao, '#new_user > div:nth-child(7) > div > div'
    element :mensagem, '#notice'

    def preencher_usuario
        nome.set 'Gabriel'
        ultimo_nome.set 'Schmitt'
        email.set 'teste@teste.com'
        endereco.set 'QND'
        universidade.set 'UDF'
        profissao.set 'Analista de Qualidade'
        genero.set 'Masculino'
        idade.set '24'
        botao.click 
    end
end