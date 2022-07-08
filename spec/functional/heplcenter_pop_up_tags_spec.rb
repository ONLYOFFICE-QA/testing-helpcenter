# frozen_string_literal: true

require 'spec_helper'

test_manager = TestingHelpCentreOnlyoffice::TestManager.new(suite_name: File.basename(__FILE__))
test = nil
tags_list_from_data = TagsListFromData.new

describe 'Pop up window buttons' do
  before do
    @help_center_home_page, test = TestingHelpCentreOnlyoffice::HelpCenterHelper.new.open_help_center_main_page(config)
  end

  after do |example|
    test_manager.add_result(example, test)
    test.webdriver.quit
  end

  it 'Closes pop up tag window' do
    tags_page = @help_center_home_page.open_tags_page
    pop_up_tag_window = tags_page.tag_click(tags_list_from_data.tags.first)
    pop_up_tag_window.close
    expect(pop_up_tag_window).not_to be_opened
  end

  it "Check 'Browse all tags link'" do
    tags_page = @help_center_home_page.open_tags_page
    pop_up_tag_window = tags_page.tag_click(tags_list_from_data.tags.first)
    pop_up_tag_window.browse_all_tags_click
    expect(pop_up_tag_window).not_to be_opened
  end
end
