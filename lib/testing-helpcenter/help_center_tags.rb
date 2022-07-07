# frozen_string_literal: true

require_relative 'help_center_tags/articles_with_tag_popup'

# Methods to work with tag list on https://helpcenter.onlyoffice.com/tags.aspx
class HelpCenterTags
  include PageObject

  def initialize(instance)
    super(instance.webdriver.driver)
    @instance = instance
    @tags_xpath = "//div[contains(@class, 'div_for_index')]//a[contains(@class, 'text-container-link')]"
    @pop_up_window_xpath = "//div[@id = 'textHelpContainer']"
  end

  # @return [Array<String>] list of tags in tags page
  def tags_list
    @instance.webdriver.get_text_of_several_elements(@tags_xpath)
  end

  def tag_click(tag_name)
    tags_list_from_data = TagsListFromData.new
    tag_index = tags_list_from_data.tags.find_index(tag_name)
    @instance.webdriver.click_on_locator("(#{@tags_xpath})[#{tag_index + 1}]")
    ArticlesWithTagPopup.new(@instance)
  end
end
