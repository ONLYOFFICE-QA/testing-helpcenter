# frozen_string_literal: true

# https://www.onlyoffice.com/registration.aspx?from=helpcenter
# https://user-images.githubusercontent.com/40513035/107354674-7fd74e00-6adf-11eb-9f6d-bcb5aaa3790f.png

module TestingHelpCentreOnlyoffice
  class SiteSignUp
    include PageObject

    text_field(:first_name, xpath: '//*[@class="txtSignUpFirstName"]')

    def initialize(instance)
      super(instance.webdriver.driver)
      instance.webdriver.wait_until do
        first_name_element.present?
      end
    end
  end
end
