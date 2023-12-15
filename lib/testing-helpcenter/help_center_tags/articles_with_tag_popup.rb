# frozen_string_literal: true

# Methods to work with Pop up tags at https://helpcenter.onlyoffice.com/tags.aspx
class ArticlesWithTagPopup
  include PageObject

  def initialize(instance)
    super(instance.webdriver.driver)
    @instance = instance
    @base_xpath = "//div[@id = 'textHelpContainer']"
    @pop_up_tags_xpath = "#{@base_xpath}//a"
    @close_button_xpath = "#{@base_xpath}//a[contains(@class, 'closeContainerButton')]"
    @browse_all_tags_xpath = "#{@base_xpath}//div[contains(@class, 'allkeywords')]//a"
  end

  # @return [Array<String>] list of tags in pop up window
  def pop_up_tags_list
    @instance.webdriver.get_text_of_several_elements(@pop_up_tags_xpath)
  end

  def close
    @instance.webdriver.click_on_locator(@close_button_xpath)
    @instance.webdriver.wait_until(wait_js: false) do
      !opened?
    end
  end

  def opened?
    @instance.webdriver.element_visible?(@base_xpath)
  end

  def browse_all_tags_click
    @instance.webdriver.click_on_locator(@browse_all_tags_xpath)
    @instance.webdriver.wait_until(wait_js: false) do
      !opened?
    end
  end
end
