# frozen_string_literal: true

# Methods to work with Pop up tags at https://helpcenter.onlyoffice.com/tags.aspx
class ArticlesWithTagPopup
  include PageObject

  def initialize(instance)
    super(instance.webdriver.driver)
    @instance = instance
    @pop_up_tags_xpath = "//div[@id = 'textHelpContent']//a"
    @close_button_xpath = "//div[@id = 'textHelpContainer']//a[contains(@class, 'closeContainerButton')]"
  end

  # @return [Array<String>] list of tags in pop up window
  def pop_up_tags_list
    @instance.webdriver.get_text_of_several_elements(@pop_up_tags_xpath)
  end

  def click_on_close_button
    @instance.webdriver.click_on_locator(@close_button_xpath)
  end
end
