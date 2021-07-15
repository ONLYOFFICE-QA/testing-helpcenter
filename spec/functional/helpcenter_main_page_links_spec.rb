# frozen_string_literal: true

require 'spec_helper'
test_manager = TestingHelpCentreOnlyoffice::TestManager.new(suite_name: File.basename(__FILE__))

describe 'Help center main page links' do
  before(:all) { @help_center_home_page, @test = TestingHelpCentreOnlyoffice::HelpCenterHelper.new.open_help_center_main_page(config) }

  after do |example|
    test_manager.add_result(example, @test)
  end

  after(:all) { @test.webdriver.quit }

  describe 'Links under search field' do
    TestingHelpCentreOnlyoffice::HelpCenterData.main_page_links.each do |title|
      it "`#{title}` link under search field works" do
        expect(@help_center_home_page).to be_help_center_links_under_search_field_alive(title)
      end
    end
  end

  describe 'Block links' do
    TestingHelpCentreOnlyoffice::HelpCenterData.main_page_block_links.each do |header_title, body_titles|
      it "Block `#{header_title}` header link works" do
        expect(@help_center_home_page).to be_help_center_block_header_link_alive(header_title)
      end

      body_titles.each do |body_title|
        it "`#{body_title}` link of `#{header_title}` block works" do
          expect(@help_center_home_page).to be_help_center_block_body_link_alive(header_title, body_title)
        end
      end
    end
  end
end
