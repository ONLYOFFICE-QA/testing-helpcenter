# frozen_string_literal: true

require_relative 'help_center_helper'
require_relative 'data/help_center_data'
require_relative 'modules/cookie_window'
require_relative 'modules/help_center_lunguages'
require_relative 'search/help_center_search_result'

module TestingHelpCentreOnlyoffice
  class HelpCenterHome
    attr_accessor :instance

    include PageObject
    include CookieWindow
    include HelpCenterLanguages

    text_field(:main_page_search, xpath: "//div[@class='search_line mainSearch']/input[@id='txtSearch']")

    def initialize(instance)
      super(instance.webdriver.driver)
      @instance = instance
      wait_to_load
      agree_with_cookie_if_shown
    end

    def wait_to_load
      @instance.webdriver.wait_until { main_page_search_element.present? }
    end

    # Perform search by string
    # @param [String] string to find
    # @return [SearchResultPage] page with result
    def search(string)
      @instance.webdriver.type_text(main_page_search_element.selector[:xpath], "#{string}\n")
      HelpCenterSearchResultPage.new(@instance)
    end
  end
end
