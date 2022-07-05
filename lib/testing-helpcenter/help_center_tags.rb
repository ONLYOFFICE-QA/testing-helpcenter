# frozen_string_literal: true

# Methods to work with tag list on https://helpcenter.onlyoffice.com/tags.aspx
class HelpCenterTags
  include PageObject

  def initialize(instance)
    super(instance.webdriver.driver)
    @instance = instance
    @tags_xpath = "//div[contains(@class, 'div_for_index')]//a[contains(@class, 'text-container-link')]"
    @hidden_tags_xpath = "#{@tags_xpath}//div[contains(@class, 'text-container-content')]//a"
  end

  def tags_list
    @instance.webdriver.get_text_of_several_elements(@tags_xpath)
  end

  def hidden_tags_list
    @instance.webdriver.get_text_of_several_elements(@hidden_tags_xpath)
  end

  def tag_click(tag_name, tags_array)
    tag_index = (tags_array.find_index(tag_name) + 1).to_s
    @instance.webdriver.get_element("//div[contains(@class, 'div_for_index')]//li[#{tag_index}]//a[contains(@class, 'text-container-link')]").click

  end
end
