# frozen_string_literal: true

require_relative 'help_center_helper'
require_relative 'data/help_center_data'
require_relative 'data/toolbar_info'
require_relative 'search/modules/help_center_side_bar_search'
require_relative 'main_page_links/modules/main_page_links'
require_relative 'main_page_links/modules/footer_links'
require_relative 'main_page_links/modules/main_page_faq'
require_relative 'main_page_links/top_toolbar_links_constructor'
require_relative 'modules/cookie_window'
require_relative 'modules/help_center_top_toolbar'
require_relative 'search/help_center_search_result'
require_relative 'external_products/site_sign_up'
require_relative 'external_products/api_main_page'

module TestingHelpCentreOnlyoffice
  # Help Center Home page
  # https://user-images.githubusercontent.com/40513035/120761168-c0f9d080-c4c9-11eb-8c37-dfc66a7a1855.png
  class HelpCenterHome
    attr_accessor :instance

    include PageObject
    include CookieWindow
    include HelpCenterMainPageFAQ
    include HelpCenterFooterLinks
    include HelpCenterMainPageLinks
    include HelpCenterTopToolbar

    text_field(:main_page_search, xpath: "//div[@class='search_line mainSearch']/input[@id='txtSearch']")
    element(:try_in_the_cloud, xpath: "//div[@class='content-header']//a[contains(@class, 'headerButton')]")

    def initialize(instance)
      super(instance.webdriver.driver)
      @instance = instance
      wait_to_load
      agree_with_cookie_if_shown
    end

    def wait_to_load
      @instance.webdriver.wait_until(wait_js: config.wait_for_js_load) do
        main_page_search_element.present?
      end
    end

    # Perform search by string
    # @param [String] string to find
    # @return [SearchResultPage] page with result
    def search(string)
      @instance.webdriver.type_text(main_page_search_element.selector[:xpath], "#{string}\n")
      HelpCenterSearchResultPage.new(@instance)
    end

    def try_in_the_cloud_button_text
      try_in_the_cloud_element.text
    end

    def try_in_the_cloud
      try_in_the_cloud_element.click
      SiteSignUp.new(@instance)
    end

    def open_tags_page
      @instance.webdriver.open("#{@instance.webdriver.current_url}/tags.aspx")
      HelpCenterTags.new(@instance)
    end
  end
end
