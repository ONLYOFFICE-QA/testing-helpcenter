# frozen_string_literal: true

# Methods to work with Pop up tags at https://helpcenter.onlyoffice.com/tags.aspx
class ArticlesWithTagPopup
  include PageObject

  def initialize(instance)
    super(instance.webdriver.driver)
    @instance = instance
    @pop_up_tags_xpath = "//div[contains(@class, 'div_for_index')]//a[contains(@class, 'text-container-link')]//div[contains(@class, 'text-container-content')]//a"
  end

  def pop_up_tags_list
    @instance.webdriver.get_text_of_several_elements(@pop_up_tags_xpath)
  end
end
