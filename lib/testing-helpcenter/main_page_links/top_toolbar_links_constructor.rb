# frozen_string_literal: true

module TestingHelpCentreOnlyoffice
  # Constructor for all links on main page for Installation Guides, Integration Guides, Administration Guides, User Guides
  class TopToolbarLinksConstructor
    include HelpCenterSideBarSearch
    include PageObject

    def initialize(instance, title)
      super(instance.webdriver.driver)
      @instance = instance
      @title_xpath = if user_guides_for_mobile?(title.to_s)
                       "//div[contains(@class, 'MobileApps')]/h1[contains(text(), '#{title}')]"
                     elsif contribution?(title.to_s)
                       "//div[contains(@class, 'GettingStarted')]//h2[contains(text(), '#{title}')]"
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

    # @return [Boolean] is page for contribution
    def contribution?(title)
      contribution_keys = ToolbarInfo.contribution_links.keys.map(&:to_s)
      contribution_keys.include?(title)
    end

    def click_logo
      @instance.webdriver.click_on_locator("//div[@class='logo push']/a")
      HelpCenterHome.new(@instance)
    end
  end
end
