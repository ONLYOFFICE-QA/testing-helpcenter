# frozen_string_literal: true

module TestingHelpCentreOnlyoffice
  # Handle operations with cookie window
  # https://user-images.githubusercontent.com/40513035/118627283-6f8adb00-b780-11eb-93e3-e605bd2f039f.png
  module CookieWindow
    include PageObject

    link(:cookie_button, xpath: "//a[@id='cookieBtnClose']")

    # @return [True, False] is cookie warning shown
    def cookie_warning_shown?
      cookie_button_element.visible?
    end

    # @return [Nothing] agree with cookie window if shown
    def agree_with_cookie_if_shown
      cookie_button_element.click if cookie_warning_shown?
    end
  end
end
