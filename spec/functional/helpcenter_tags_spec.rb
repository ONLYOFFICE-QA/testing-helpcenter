# frozen_string_literal: true

require 'spec_helper'

test_manager = TestingHelpCentreOnlyoffice::TestManager.new(suite_name: File.basename(__FILE__))
test = nil
tags_list_from_data = TagsListFromData.new

describe 'Help center tags' do
  before do
    @help_center_home_page, test = TestingHelpCentreOnlyoffice::HelpCenterHelper.new.open_help_center_main_page(config)
  end

  after do |example|
    test_manager.add_result(example, test)
    test.webdriver.quit
  end

  it 'Check tags from list' do
    tags_page = @help_center_home_page.open_tags_page
    expect(tags_page.tags_list).to eq(tags_list_from_data.tags)
  end
end
