# frozen_string_literal: true

module TestingHelpCentreOnlyoffice
  # https://api.onlyoffice.com/
  # https://user-images.githubusercontent.com/40513035/120454554-d85d8000-c348-11eb-8c78-9b5845d8de63.png
  class ApiMainPage
    include PageObject

    span(:main_page_title, xpath: '//span[@class="hdr title-main"]')

    def initialize(instance)
      super(instance.webdriver.driver)
      instance.webdriver.wait_until { main_page_title_element.present? }
    end

    def api_opened?
      main_page_title_element.text == 'Welcome to ONLYOFFICE API'
    end
  end
end
