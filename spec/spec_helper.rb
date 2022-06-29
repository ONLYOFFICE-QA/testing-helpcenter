# frozen_string_literal: true

require_relative '../lib/testing_helpcenter'
require_relative '../shared_examples/help_center_search'
require_relative '../lib/testing-helpcenter/data/page_title_list'
require 'onlyoffice_testrail_wrapper'
require 'rspec'
require 'rspec/retry'

def config
  @config ||= TestingHelpCentreOnlyoffice::Config.new
end

RSpec.configure do |config|
  is_debug = OnlyofficeFileHelper::RubyHelper.debug?
  config.default_retry_count = if is_debug
                                 1
                               else
                                 2
                               end
  config.verbose_retry = true
end
