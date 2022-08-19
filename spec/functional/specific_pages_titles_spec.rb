# frozen_string_literal: true

require 'spec_helper'

test_manager = TestingHelpCentreOnlyoffice::TestManager.new(suite_name: File.basename(__FILE__))
test = nil
page_hash = PageTitleList.new

describe 'Help center footer links' do
  before do
    _help_center_home_page, test = TestingHelpCentreOnlyoffice::HelpCenterHelper.new.open_help_center_main_page(config)
  end

  after do |example|
    test_manager.add_result(example, test)
    test.webdriver.quit
  end

  page_hash.hash.each do |hash|
    it "Check page title of '#{hash[:url]}'" do
      page_to_open = "#{test.webdriver.current_url}#{hash[:url]}"
      test.webdriver.open(page_to_open)
      expect(test.webdriver.title_of_current_tab).to eq((hash[:title]))
    end
  end
end
