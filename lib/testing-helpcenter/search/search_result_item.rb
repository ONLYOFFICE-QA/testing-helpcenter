# frozen_string_literal: true

# Single item in search result for help center
# https://user-images.githubusercontent.com/40513035/118722660-4189b300-b7e1-11eb-9fa1-beae70816aad.png

module TestingHelpCentreOnlyoffice
  class HelpCenterResultItem
    def initialize(instance, index)
      @instance = instance
      search_item_xpath = "//div[@class='searchResult']"
      @title_xpath = "(#{search_item_xpath}//a)[#{index}]"
      @snippet_xpath = "(#{search_item_xpath}//p)[#{index}]"
    end

    def snippet_text
      @instance.webdriver.get_element(@snippet_xpath).text
    end

    def click_search_title
      @instance.webdriver.get_element(@title_xpath).click
    end
  end
end
