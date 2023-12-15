# frozen_string_literal: true

require_relative 'links_response'

module TestingHelpCentreOnlyoffice
  # Main page FAQ links
  # https://user-images.githubusercontent.com/40513035/122872675-a30fd680-d2e5-11eb-8cc0-1f8bdb195434.png
  module HelpCenterMainPageFAQ
    include PageObject
    include LinksResponse

    list_item(:main_page_faq_list, xpath: "//div[@class='faq_pricing_block']/ul/li")

    def faq_number
      @instance.webdriver.driver.find_elements(:xpath, main_page_faq_list_element.selector[:xpath]).count
    end

    def open_main_page_faq(title)
      faq_answer_link_title = HelpCenterData.main_page_faq_links[title][0]
      return if faq_answer_link_visible?(title, faq_answer_link_title)

      @instance.webdriver.driver.find_element(:xpath, faq_question_xpath(title)).click
      @instance.webdriver.wait_until(wait_js: false) { faq_answer_link_visible?(title, faq_answer_link_title) }
    end

    def faq_question_xpath(title)
      "//div[@class='faq_pricing_block']//ul/li/b[text()='#{title}']"
    end

    def faq_answer_xpath(faq_title, answer_title)
      "#{faq_question_xpath(faq_title)}/..//a[text()='#{answer_title}']"
    end

    def faq_answer_link_visible?(faq_title, answer_title)
      @instance.webdriver.element_visible?(faq_answer_xpath(faq_title, answer_title))
    end

    def help_center_faq_answer_link_alive?(faq_title, answer_title)
      answer_element = @instance.webdriver.driver.find_element(:xpath, faq_answer_xpath(faq_title, answer_title))
      link_success_response?(answer_element.attribute('href'))
    end
  end
end
