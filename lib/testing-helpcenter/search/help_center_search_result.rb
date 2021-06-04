# frozen_string_literal: true

require_relative 'search_result_item'

module TestingHelpCentreOnlyoffice
  # /search.aspx
  # https://user-images.githubusercontent.com/40513035/118632927-c646e380-b785-11eb-883a-cfd2fd882f70.png
  class HelpCenterSearchResultPage
    include PageObject

    search_item_xpath = "//div[@class='searchResult']"
    list_item(:search_result_entry, xpath: "#{search_item_xpath}/ol/li")
    h1(:no_result_found, xpath: "#{search_item_xpath}/h1")

    def initialize(instance)
      super(instance.webdriver.driver)
      @instance = instance
      wait_to_load
    end

    def wait_to_load
      @instance.webdriver.wait_until do
        no_result_found_element.present? || search_result_entry_element.present?
      end
    end

    # @return [Integer] found entries count
    def search_result_count
      return 0 if no_result_found_element.present?

      @instance.webdriver.driver.find_elements(:xpath, search_result_entry_element.selector[:xpath]).count
    end

    # @return [Array] of search results
    def search_results
      results_array = []
      search_result_count.times { |index| results_array << HelpCenterResultItem.new(@instance, index + 1) }
      results_array
    end
  end
end
