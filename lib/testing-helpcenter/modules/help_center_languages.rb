# frozen_string_literal: true

# Top toolbar languages selector for help center
# https://user-images.githubusercontent.com/40513035/119119895-83347c80-b9e0-11eb-87ef-47dd537b9a5a.png

module TestingHelpCentreOnlyoffice
  module HelpCenterLanguages
    include PageObject

    div(:page_language, xpath: '(//div[@id="LanguageSelector"]/div[contains(@class, "title")])[1]')
    elements(:language_select, xpath: "//li[contains(@class, 'option')]")

    def current_page_language
      @instance.webdriver.wait_until do
        page_language_element.present?
      end
      page_language_element.attribute('class').split.at(1)
    end

    def set_page_language(lang_to_set)
      return if lang_to_set.nil?
      return if lang_to_set == current_page_language

      open_list_languages_page unless language_select_elements[1].present?
      xpath_of_lang = "//li[@class='option #{lang_to_set}']/a"
      @instance.webdriver.click_on_locator xpath_of_lang
    end

    def open_list_languages_page
      page_language_element.click
      @instance.webdriver.wait_until do
        @instance.webdriver.element_present?(language_select_elements[1])
      end
    end

    def all_language_help_center
      open_list_languages_page
      languages = []
      language_select_elements.each do |current_language|
        language = current_language.attribute('class').split.at(1)
        languages << language if current_language.visible?
      end
      languages
    end
  end
end
