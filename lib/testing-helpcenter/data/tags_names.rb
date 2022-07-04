# frozen_string_literal: true

require 'json'
# Open JSON file and parse it's data to TagsNames file
class TagsNames
  attr_reader :tags

  def initialize(file_path = 'lib/testing-helpcenter/data/tags_list.json')
    raw_data = File.read(file_path)
    @tags = JSON.parse(raw_data, symbolize_names: true)
  end
end
