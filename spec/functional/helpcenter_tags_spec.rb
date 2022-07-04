# frozen_string_literal: true

require 'spec_helper'

test_manager = TestingHelpCentreOnlyoffice::TestManager.new(suite_name: File.basename(__FILE__))
test = nil
@tags = nil
tags_hash = TagsNames.new

describe 'Help center tags' do
  before do
    @help_center_home_page, test = TestingHelpCentreOnlyoffice::HelpCenterHelper.new.open_help_center_main_page(config)
    tags_page = @help_center_home_page.open_tags_page
    @tags = tags_page.tags_list
  end

  after do |example|
    test_manager.add_result(example, test)
    test.webdriver.quit
  end

  @tags.each do |tag|
    it "check tag #{tag} exists" do
      expect(tag).to eq(tags_hash[:text])
    end
  end
end
