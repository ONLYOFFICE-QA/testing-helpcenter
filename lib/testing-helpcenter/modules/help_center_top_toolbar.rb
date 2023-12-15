# frozen_string_literal: true

require_relative '../help_center_home'
require_relative '../external_products/api_main_page'
require_relative '../main_page_links/top_toolbar_links_constructor'
require_relative 'help_center_languages'

module TestingHelpCentreOnlyoffice
  # Help center top toolbar
  # https://user-images.githubusercontent.com/40513035/120143348-d3f06600-c194-11eb-9f07-d3f125d3df6b.png
  module HelpCenterTopToolbar
    include PageObject
    include HelpCenterLanguages

    link(:logo_home, xpath: '//div[contains(@class, "logo")]//a')

    link(:installation, xpath: '//a[@id="navitem_server"]')
    link(:administration, xpath: '//a[@id="navitem_administration"]')
    link(:integration, xpath: '//a[@id="navitem_integration"]')
    link(:user_guides, xpath: '//a[@id="navitem_features"]')
    link(:contribution, xpath: '//a[@id="navitem_saas"]')
    link(:development, xpath: '//a[@id="navitem_development"]')

    def click_home_logo
      logo_home_element.click
      HelpCenterHome.new(@instance)
    end

    def toolbar_section_xpath(link_id)
      "//li[@id='#{link_id}']/a"
    end

    def click_toolbar_installation_link(link_title)
      @instance.webdriver.move_to_element_by_locator(installation_element.selector[:xpath])
      link_xpath = toolbar_section_xpath(ToolbarInfo.installation_links[link_title])
      click_menu_link_by_xpath(link_xpath, link_title)
    end

    def click_toolbar_administration_link(link_title)
      @instance.webdriver.move_to_element_by_locator(administration_element.selector[:xpath])
      link_xpath = toolbar_section_xpath(ToolbarInfo.administration_links[link_title])
      click_menu_link_by_xpath(link_xpath, link_title)
    end

    def click_toolbar_integration_link(link_title)
      @instance.webdriver.move_to_element_by_locator(integration_element.selector[:xpath])
      link_xpath = toolbar_section_xpath(ToolbarInfo.integration_links[link_title])
      click_menu_link_by_xpath(link_xpath, link_title)
    end

    def click_toolbar_user_guides_link(link_title)
      @instance.webdriver.move_to_element_by_locator(user_guides_element.selector[:xpath])
      link_xpath = toolbar_section_xpath(ToolbarInfo.user_guides_links[link_title])
      click_menu_link_by_xpath(link_xpath, link_title)
    end

    def click_toolbar_contribution_link(link_title)
      @instance.webdriver.move_to_element_by_locator(contribution_element.selector[:xpath])
      link_xpath = toolbar_section_xpath(ToolbarInfo.contribution_links[link_title])
      click_menu_link_by_xpath(link_xpath, link_title)
    end

    def click_menu_link_by_xpath(link_xpath, link_title)
      @instance.webdriver.wait_until(wait_js: false) { @instance.webdriver.element_present?(link_xpath) }
      @instance.webdriver.driver.find_element(:xpath, link_xpath).click
      TopToolbarLinksConstructor.new(@instance, link_title)
    end

    def click_toolbar_development
      development_element.click
      ApiMainPage.new(@instance)
    end
  end
end
