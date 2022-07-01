# frozen_string_literal: true

# Methods to work with tag list on https://helpcenter.onlyoffice.com/tags.aspx
class HelpCenterTags
  include PageObject

  def initialize(instance)
    super(instance.webdriver.driver)
    @instance = instance
    @xpath = "//div[contains(@class, 'div_for_index')]//a[contains(@class, 'text-container-link')]"
  end

  def tags_list
    @instance.webdriver.get_text_of_several_elements(@xpath)
  end
end
