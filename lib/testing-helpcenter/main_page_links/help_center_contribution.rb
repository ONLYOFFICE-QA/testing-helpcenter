# frozen_string_literal: true

require_relative '../search/modules/help_center_side_bar_search'

module TestingHelpCentreOnlyoffice
  # /guides/become-translator.aspx
  # https://user-images.githubusercontent.com/40513035/120451570-697f2780-c346-11eb-9fbd-577b0b625a3d.png
  class HelpCenterContribution
    include PageObject
    include HelpCenterSideBarSearch

    div(:participating_block, xpath: "//div[@id='Participating_block']")

    def initialize(instance)
      super(instance.webdriver.driver)
      @instance = instance
      instance.webdriver.wait_until { participating_in_translation_block_present? }
    end

    def participating_in_translation_block_present?
      participating_block_element.present?
    end
  end
end
