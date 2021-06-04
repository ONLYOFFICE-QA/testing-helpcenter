# frozen_string_literal: true

require_relative '../help_center_search_result'

module TestingHelpCentreOnlyoffice
  # Left side bar search for help center
  # https://user-images.githubusercontent.com/40513035/120606733-5d599f80-c404-11eb-8fa4-d0f731ab2515.png
  module HelpCenterSideBarSearch
    include PageObject

    text_field(:side_search, xpath: "(//input[@id='txtSearch'])[1]")

    def search(string)
      @instance.webdriver.type_text(side_search_element.selector[:xpath], "#{string}\n")
      HelpCenterSearchResultPage.new(@instance)
    end
  end
end
