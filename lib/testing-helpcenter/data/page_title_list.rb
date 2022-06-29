# frozen_string_literal: true
<<<<<<< HEAD

require 'json'
# Open JSON file and parse it's data to PageTitleList object
class PageTitleList
  attr_reader :hash

  def initialize(file_path = 'lib/testing-helpcenter/data/page_titles.json')
    raw_data = File.read(file_path)
    @hash = JSON.parse(raw_data, symbolize_names: true)
  end
=======
require 'json'

class PageTitleList
  attr_reader :hash

  def initialize( file_path )
    @raw_data = File.read(file_path)
    @hash = JSON.parse(@raw_data, { symbolize_names: true})
  end

>>>>>>> 960e86f (Add JSON)
end
