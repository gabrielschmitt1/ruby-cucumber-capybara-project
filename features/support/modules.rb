# Pegando todos os arquivos que terminem com _page.rb e colocando em uma variavel file e depois requerindo ela
Dir[File.join(File.dirname(__FILE__), '../pages/*_page.rb')].each { |file| require file }

module Pages
    # Metodo para instaciar classe User
    def user
        @user ||= User.new 
    end   
end

module Helper
    # Metodo que recebe o nome do arquivo e seu resultado
    def tirar_foto(nome_arquivo, resultado)
        caminho_arquivo = "reports/screenshots/test_#{resultado}"
        foto = "#{caminho_arquivo}/#{nome_arquivo}.png"
        page.save_screenshot(foto)
        embed(foto, 'image/png', 'Clique aqui')
    end
end
