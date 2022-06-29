# frozen_string_literal: true

require 'json'
# Open JSON file and parse it's data to PageTitleList object
class PageTitleList
  attr_reader :hash

  def initialize(file_path = 'lib/testing-helpcenter/data/page_titles.json')
    raw_data = File.read(file_path)
    @hash = JSON.parse(raw_data, symbolize_names: true)
  end
end
