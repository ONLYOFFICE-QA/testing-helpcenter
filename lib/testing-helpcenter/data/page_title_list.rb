# frozen_string_literal: true
require 'json'

class PageTitleList
  attr_reader :hash

  def initialize( file_path )
    @raw_data = File.read(file_path)
    @hash = JSON.parse(@raw_data, { symbolize_names: true})
  end

end
