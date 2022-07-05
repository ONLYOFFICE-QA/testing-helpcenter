# frozen_string_literal: true

# Methods to work with Pop up tags at https://helpcenter.onlyoffice.com/tags.aspx
class ArticlesWithTagPopup
  include PageObject

  def initialize(instance)
    super(instance.webdriver.driver)
    @instance = instance
    @pop_up_tags_xpath = "//div[@id = 'textHelpContent']//a"
  end

  def pop_up_tags_list
    @instance.webdriver.get_text_of_several_elements(@pop_up_tags_xpath)
  end
end
