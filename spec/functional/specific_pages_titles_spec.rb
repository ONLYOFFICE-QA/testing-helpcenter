# frozen_string_literal: true

require 'spec_helper'
require_relative '../../lib/testing-helpcenter/data/page_title_list'

test_manager = TestingHelpCentreOnlyoffice::TestManager.new(suite_name: File.basename(__FILE__))
test = nil
<<<<<<< HEAD
page_hash = PageTitleList.new
=======
page_hash = PageTitleList.new('lib/testing-helpcenter/data/page_titles.json')
>>>>>>> 960e86f (Add JSON)

describe 'Help center footer links' do
  before do
    _help_center_home_page, test = TestingHelpCentreOnlyoffice::HelpCenterHelper.new.open_help_center_main_page(config)

  end

  after do |example|
    test_manager.add_result(example, test)
    test.webdriver.quit
  end

  page_hash.hash.each do |hash|
<<<<<<< HEAD
    it "Check page title of '#{hash[:url]}'" do
      page_to_open = "#{test.webdriver.get_url}#{hash[:url]}"
      test.webdriver.open(page_to_open)
      expect(test.webdriver.get_title_of_current_tab).to eq((hash[:title]))
=======
    it "check page title of #{hash[:url]}" do
      page_to_open = "#{test.webdriver.get_url}#{hash[:url]}"
      test.webdriver.open(page_to_open)
      expect(test.webdriver.get_title_of_current_tab).to eq((hash[:title]).to_s)
>>>>>>> 960e86f (Add JSON)
    end
  end
end
