# frozen_string_literal: true

require 'spec_helper'
test_manager = TestingHelpCentreOnlyoffice::TestManager.new(suite_name: File.basename(__FILE__))

describe 'Help center search' do
  before do
    @help_center_home_page, @test = TestingHelpCentreOnlyoffice::HelpCenterHelper.new.open_help_center_main_page(config)
  end

  after do |example|
    test_manager.add_result(example, @test)
    @test.webdriver.quit
  end

  describe 'Main page search' do
    it_behaves_like 'help_center_search', 'Main Page' do
      let(:current_page) { @help_center_home_page }
    end
  end

  describe 'Side menu search' do
    let(:contribution_page) { @help_center_home_page.click_toolbar_contribution_link(:Translating) }

    it_behaves_like 'help_center_search', 'Side Menu' do
      let(:current_page) { contribution_page }
    end
  end
end
