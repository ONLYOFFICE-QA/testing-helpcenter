# frozen_string_literal: true

require 'spec_helper'
test_manager = TestingHelpCentreOnlyoffice::TestManager.new(suite_name: File.basename(__FILE__))

describe 'Help center top toolbar menu' do
  before do
    @help_center_home_page, @test = TestingHelpCentreOnlyoffice::HelpCenterHelper.new.open_help_center_main_page(config)
  end

  after do |example|
    test_manager.add_result(example, @test)
    @test.webdriver.quit
  end

  describe 'Administration' do
    TestingHelpCentreOnlyoffice::ToolbarInfo.administration_links.each_key do |title|
      it "[Administration] Open #{title.to_s} page" do
        administration_page = @help_center_home_page.click_link_on_toolbar(title)
        expect(administration_page).to be_title_element_present
      end
    end
  end
end
