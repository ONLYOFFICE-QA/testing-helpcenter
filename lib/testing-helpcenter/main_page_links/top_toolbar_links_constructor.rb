# frozen_string_literal: true

module TestingHelpCentreOnlyoffice
  # Constructor for all links on main page for Installation Guides, Integration Guides, Administration Guides, User Guides
  class TopToolbarLinksConstructor
    include PageObject

    def initialize(instance, title)
      super(instance.webdriver.driver)
      @instance = instance
      @title_xpath = if user_guides_for_mobile?(title.to_s)
                       "//div[contains(@class, 'MobileApps')]/h1[contains(text(), '#{title}')]"
                     else
                       "//div[@id='toggleMenuEditors']/ul/li/h2[contains(text(), '#{title}')]"
                     end
      wait_to_load
    end

    def wait_to_load
      @instance.webdriver.wait_until { title_element_present? }
    end

    def title_element_present?
      @instance.webdriver.element_present?(@title_xpath)
    end

    def user_guides_for_mobile?(title)
      title.include?('iOS') || title.include?('Android')
    end
  end
end
