# frozen_string_literal: true

module TestingHelpCentreOnlyoffice
  # Main Page links xpath, elements
  # https://user-images.githubusercontent.com/40513035/122003839-75b4ad00-cd68-11eb-9bfa-e1e98f5f394b.png
  module HelpCenterMainPageLinks
    # Main page block links constructor
    # https://user-images.githubusercontent.com/40513035/122003956-9c72e380-cd68-11eb-9eac-a942338a5f00.png
    def help_center_block_header_link_xpath(title)
      "//div[@class='helpcenter_block']//a[text()='#{title}']"
    end

    def help_center_block_header_link_element(title)
      help_center_block_header_link_xpath = help_center_block_header_link_xpath(title)
      @instance.webdriver.driver.find_element(:xpath, help_center_block_header_link_xpath)
    end

    def help_center_block_body_link_element(header_title, body_title)
      help_center_block_body_link_xpath = "#{help_center_block_header_link_xpath(header_title)}/../..//p/a[text()='#{body_title}']"
      @instance.webdriver.driver.find_element(:xpath, help_center_block_body_link_xpath)
    end

    def help_center_block_header_link_alive?(header_title)
      link_success_response?(help_center_block_header_link_element(header_title).attribute('href'))
    end

    def help_center_block_body_link_alive?(header_title, body_title)
      link_success_response?(help_center_block_body_link_element(header_title, body_title).attribute('href'))
    end

    # Main page links under search field constructor
    # https://user-images.githubusercontent.com/40513035/122003897-882ee680-cd68-11eb-8baa-cd430ba21dcb.png
    def help_center_links_under_search_field_alive?(title)
      link_xpath = "//div[@id='productsMainContent']//a[text()='#{title}']"
      link_element = @instance.webdriver.driver.find_element(:xpath, link_xpath)
      link_success_response?(link_element.attribute('href'))
    end

    # determines success based on 2xx response code
    # http://www.restapitutorial.com/httpstatuscodes.html
    def link_success_response?(link)
      response = HTTParty.head(link).response.code
      @instance.webdriver.webdriver_error("Link `#{link}` answered with #{response}") unless response.start_with?('2')
      true
    end
  end
end
