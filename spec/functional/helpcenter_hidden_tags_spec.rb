# frozen_string_literal: true

require 'spec_helper'

test_manager = TestingHelpCentreOnlyoffice::TestManager.new(suite_name: File.basename(__FILE__))
test = nil
tags_list_from_data = TagsListFromData.new

describe 'Help center hidden tags' do
  before do
    @help_center_home_page, test = TestingHelpCentreOnlyoffice::HelpCenterHelper.new.open_help_center_main_page(config)
  end

  after do |example|
    test_manager.add_result(example, test)
    test.webdriver.quit
  end

  it 'Check first hidden tag' do
    tags_page = @help_center_home_page.open_tags_page
    tags_page.tag_click('access level', tags_list_from_data.tags)
    expect(tags_page.hidden_tags_list).not_to be_empty
  end
end
