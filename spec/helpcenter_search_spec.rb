# frozen_string_literal: true

require 'spec_helper'
test_manager = TestingHelpCentreOnlyoffice::TestManager.new(suite_name: File.basename(__FILE__))

describe 'Help center search' do
  before do
    @help_center_home_page, @test = TestingHelpCentreOnlyoffice::HelpCenterHelper.new.open_help_center_main_page(config)
  end

  it 'Non-existing word return `No results matching your query could be found` and zero found results' do
    result_page = @help_center_home_page.search('Fakeword')
    expect(result_page.no_result_found_element).to be_present
    expect(result_page.search_result_count).to eq(0)
  end

  it 'Search for existing method result several results' do
    search_string = 'TEST'
    result_page = @help_center_home_page.search(search_string)
    expect(result_page.search_result_count).to be > 0
    expect(result_page.search_results.first.snippet_text).to be_include(search_string)
  end

  after do |example|
    test_manager.add_result(example, @test)
    @test.webdriver.quit
  end
end
