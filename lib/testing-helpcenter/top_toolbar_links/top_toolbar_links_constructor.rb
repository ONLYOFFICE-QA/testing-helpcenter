# Constructor for all links on main page for Installation Guides, Integration Guides, Administration Guides, User Guides, Developer Guides, Contribution Guides

module TestingHelpCentreOnlyoffice
  class TopToolbarLinksConstructor

    include PageObject

    def initialize(instance, title)
      super(instance.webdriver.driver)
      @instance = instance
      @title_xpath = "//div[@id='toggleMenuEditors']/ul/li/h2[contains(text(), '#{title}')]"
      wait_to_load
    end

    def wait_to_load
      @instance.webdriver.wait_until { title_element_present? }
    end

    def title_element_present?
      @instance.webdriver.driver.find_element(:xpath, @title_xpath).present?
    end
  end
end
