# frozen_string_literal: true

require_relative 'help_center_test_instance'

module TestingHelpCentreOnlyoffice
  # Help center additional methods
  class HelpCenterHelper
    attr_accessor :test

    def open_help_center_main_page(config)
      OnlyofficeLoggerHelper.log("Init browser: Open: #{config.server}")
      @test = HelpCenterInstance.new(config)
      main_page = HelpCenterHome.new(@test)
      main_page.set_page_language(config.language)
      [main_page, @test]
    end
  end
end
