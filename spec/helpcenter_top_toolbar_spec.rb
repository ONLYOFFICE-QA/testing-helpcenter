# frozen_string_literal: true

require 'spec_helper'
test_manager = TestingHelpCentreOnlyoffice::TestManager.new(suite_name: File.basename(__FILE__))

describe 'Help center top toolbar check' do
  before do
    @help_center_home_page, @test = TestingHelpCentreOnlyoffice::HelpCenterHelper.new.open_help_center_main_page(config)
  end

  after do |example|
    test_manager.add_result(example, @test)
    @test.webdriver.quit
  end

  describe 'Languages' do
    it 'Check exists languages' do
      expect(@help_center_home_page.all_language_help_center).to eq(TestingHelpCentreOnlyoffice::HelpCenterData.help_center_languages)
    end

    TestingHelpCentreOnlyoffice::HelpCenterData.help_center_languages.each do |current_language|
      it "Check language change to #{current_language}" do
        @help_center_home_page.set_page_language(current_language)
        expect(@help_center_home_page.try_in_the_cloud_button_text).to eq(TestingHelpCentreOnlyoffice::HelpCenterData.try_in_the_cloud_button_translate[current_language.to_sym])
      end
    end
  end

  it 'Check `Try in the cloud` button ' do
    site_sign_up = @help_center_home_page.try_in_the_cloud
    expect(site_sign_up).to be_a TestingHelpCentreOnlyoffice::SiteSignUp
  end
end
