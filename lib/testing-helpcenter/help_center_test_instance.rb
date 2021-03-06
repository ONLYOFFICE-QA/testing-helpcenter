# frozen_string_literal: true

require 'bundler/setup'
require 'httparty'
require 'onlyoffice_webdriver_wrapper'
require 'palladium'
require_relative 'test_manger/test_manager'

module TestingHelpCentreOnlyoffice
  # Instance of browser to perform actions
  class HelpCenterInstance
    attr_accessor :webdriver
    alias driver webdriver
    alias selenium webdriver

    def initialize(config)
      @webdriver = OnlyofficeWebdriverWrapper::WebDriver.new(config.browser, record_video: false)
      @webdriver.open(config.server)
    end
  end
end
