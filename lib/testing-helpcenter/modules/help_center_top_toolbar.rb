# Help center top toolbar
# https://user-images.githubusercontent.com/40513035/120143348-d3f06600-c194-11eb-9f07-d3f125d3df6b.png
require_relative '../help_center_home'
require_relative '../top_toolbar_links/top_toolbar_links_constructor'
require_relative 'help_center_languages'

module TestingHelpCentreOnlyoffice
  module HelpCenterTopToolbar
    include PageObject
    include HelpCenterLanguages


    link(:logo_home, xpath: '//div[contains(@class, "logo")]//a')

    link(:administration, xpath: '//a[@id="navitem_administration"]')

    def click_home_logo
      logo_home_element.click
      HelpCenterHome.new(@instance)
    end

    def toolbar_section_xpath(link_id)
      link_xpath = "//li[@id='#{link_id}']/a"
      @instance.webdriver.driver.find_element(:xpath, link_xpath)
    end

    def click_link_on_toolbar(section)
      if TestingHelpCentreOnlyoffice::ToolbarInfo.administration_links.key?(section)
        @instance.webdriver.move_to_element_by_locator(administration_element.selector[:xpath])
      end
      section_element = toolbar_section_xpath(ToolbarInfo.administration_links[section])
      @instance.webdriver.wait_until { section_element.present? }
      section_element.click
      TopToolbarLinksConstructor.new(@instance, section)
    end
  end
end
