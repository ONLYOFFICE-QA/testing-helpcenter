# frozen_string_literal: true

require 'spec_helper'
test_manager = TestingHelpCentreOnlyoffice::TestManager.new(suite_name: File.basename(__FILE__))
help_center_home_page, test = TestingHelpCentreOnlyoffice::HelpCenterHelper.new.open_help_center_main_page(config)

describe 'Help center FAQ links' do
  after do |example|
    test_manager.add_result(example, test)
  end

  after(:all) { test.webdriver.quit }

  TestingHelpCentreOnlyoffice::HelpCenterData.main_page_faq_links.each do |question_title, answer_links|
    describe question_title.to_s do
      before { help_center_home_page.open_main_page_faq(question_title) }

      answer_links.each do |answer_link|
        it "`#{answer_link}` link of `#{question_title}` faq works" do
          expect(help_center_home_page).to be_help_center_faq_answer_link_alive(question_title, answer_link)
        end
      end
    end
  end

  it "Main page FAQ questions number didn't change" do
    expect(help_center_home_page.faq_number).to eq(TestingHelpCentreOnlyoffice::HelpCenterData.main_page_faq_links.count)
  end
end
