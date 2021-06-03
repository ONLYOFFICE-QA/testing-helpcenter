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
      it "[Administration] Open #{title} page" do
        administration_page = @help_center_home_page.click_toolbar_administration_link(title)
        expect(administration_page).to be_title_element_present
      end
    end
  end

  describe 'Installation' do
    TestingHelpCentreOnlyoffice::ToolbarInfo.installation_links.each_key do |title|
      it "[Installation] Open #{title} page" do
        installation_page = @help_center_home_page.click_toolbar_installation_link(title)
        expect(installation_page).to be_title_element_present
      end
    end
  end

  describe 'Integration' do
    TestingHelpCentreOnlyoffice::ToolbarInfo.integration_links.each_key do |title|
      it "[Integration] Open #{title} page" do
        integration_page = @help_center_home_page.click_toolbar_integration_link(title)
        expect(integration_page).to be_title_element_present
      end
    end
  end

  describe 'User Guides' do
    TestingHelpCentreOnlyoffice::ToolbarInfo.user_guides_links.each_key do |title|
      it "[User Guides] Open #{title} page" do
        user_guides_page = @help_center_home_page.click_toolbar_user_guides_link(title)
        expect(user_guides_page).to be_title_element_present
      end
    end
  end

  it 'Open `Contribution` page' do
    contribution_page = @help_center_home_page.click_toolbar_contribution
    expect(contribution_page).to be_participating_in_translation_block_present
  end

  it 'Open `Development` page' do
    development_page = @help_center_home_page.click_toolbar_development
    expect(development_page).to be_api_opened
  end
end
