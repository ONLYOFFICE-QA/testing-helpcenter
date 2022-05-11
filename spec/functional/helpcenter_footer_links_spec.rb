# frozen_string_literal: true

require 'spec_helper'
test_manager = TestingHelpCentreOnlyoffice::TestManager.new(suite_name: File.basename(__FILE__))
help_center_home_page, test = TestingHelpCentreOnlyoffice::HelpCenterHelper.new.open_help_center_main_page(config)

describe 'Help center footer links' do
  after do |example|
    test_manager.add_result(example, test)
  end

  after(:all) { test.webdriver.quit }

  TestingHelpCentreOnlyoffice::HelpCenterData.footer_links.each do |section_title, titles|
    titles.each do |title|
      it "`#{title}` link of `#{section_title}` footer section works" do
        pending('Link `https://www.instagram.com/the_onlyoffice/` answered with 405') if title == 'Follow us on Instagram'
        pending('Link to Medium blog answered with 403') if title == 'Follow us on Medium'
        expect(help_center_home_page).to be_help_center_footer_link_alive(section_title, title)
      end
    end
  end
end
