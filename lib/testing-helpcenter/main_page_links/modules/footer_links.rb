# frozen_string_literal: true

require_relative 'links_response'

module TestingHelpCentreOnlyoffice
  # Main Page footer links constructor
  # https://user-images.githubusercontent.com/40513035/122345228-7b42fc00-cefc-11eb-8acc-0f51d48e1867.png
  module HelpCenterFooterLinks
    include LinksResponse

    def help_center_footer_link_alive?(section_title, title)
      link_xpath = get_footer_xpath(section_title, title)
      link_element = @instance.webdriver.driver.find_element(:xpath, link_xpath)
      link_success_response?(link_element.attribute('href'))
    end

    def get_footer_xpath(section_title, title)
      if section_title == :'Follow us on'
        "//div[@id='footer-block']//a[@title='#{title}']"
      else
        "//div[@id='footer-block']//a[text()='#{title}']"
      end
    end
  end
end
