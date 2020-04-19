require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require_relative 'modules.rb'

# Definindo metodo como Global
World(Helper)
World(Pages)

BROWSER = ENV['BROWSER']
AMBIENTE = ENV['AMBIENTE']

# Config carrega o arquivo .yml criado no diretorio ambientes e é utilizado conforme o profile
CONFIG = YAML.load_file(File.dirname(__FILE__) + "/ambientes/#{AMBIENTE}.yml")

Capybara.register_driver :selenium do |app|
    if BROWSER.eql?('chrome')
        Capybara::Selenium::Driver.new(app, :browser => :chrome,)
    # Headless
    elsif BROWSER.eql?('chrome_headless')
        Capybara::Selenium::Driver.new(app, :browser => :chrome,
            desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
                'chromeOptions' => {'args' => ['--headless', 'disable-gpu', '--DNS-prefetch-disable']}
            )
        )
    elsif BROWSER.eql?('firefox')
        Capybara::Selenium::Driver.new(app, :browser => :firefox, :marionette =>true)
    elsif BROWSER.eql?('firefox_headless')
        browser_options = Selenium::WebDriver::Firefox::Options.new(args: ['--headless'])
        Capybara::Selenium::Driver.new(app, :browser => :firefox, options: browser_options)
    #elsif BROWSER.eql?('ie')
    #    Capybara::Selenium::Driver.new(app, :browser => :internet_explorer)
    end
end

Capybara.configure do |config|
    config.default_driver = :selenium
    config.app_host = CONFIG['url_padrao']
    config.default_max_wait_time = 10
end