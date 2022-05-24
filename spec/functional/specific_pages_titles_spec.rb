# frozen_string_literal: true

require 'spec_helper'

test_manager = TestingHelpCentreOnlyoffice::TestManager.new(suite_name: File.basename(__FILE__))
test = nil

describe 'Help center footer links' do
  before do
    _help_center_home_page, test = TestingHelpCentreOnlyoffice::HelpCenterHelper.new.open_help_center_main_page(config)
  end

  after do |example|
    test_manager.add_result(example, test)
    test.webdriver.quit
  end

  it 'DesktopEditors Install flatpak title' do
    page_to_open = "#{test.webdriver.get_url}installation/desktop-install-flatpak.aspx"
    test.webdriver.open(page_to_open)
    expect(test.webdriver.get_title_of_current_tab).to eq('ONLYOFFICE - Cloud Office Applications')
  end

  it 'DesktopEditors Install Ubuntu title' do
    page_to_open = "#{test.webdriver.get_url}installation/desktop-install-ubuntu.aspx"
    test.webdriver.open(page_to_open)
    expect(test.webdriver.get_title_of_current_tab).to eq('Installing ONLYOFFICE Desktop Editors to Debian, Ubuntu and derivatives - ONLYOFFICE')
  end

  it 'DesktopEditors Install RHEL title' do
    page_to_open = "#{test.webdriver.get_url}installation/desktop-install-rhel.aspx"
    test.webdriver.open(page_to_open)
    expect(test.webdriver.get_title_of_current_tab).to eq('Installing ONLYOFFICE Desktop Editors to Red Hat, CentOS and derivatives - ONLYOFFICE')
  end
end
