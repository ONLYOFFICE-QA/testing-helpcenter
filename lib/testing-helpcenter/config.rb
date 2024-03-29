# frozen_string_literal: true

module TestingHelpCentreOnlyoffice
  # Config of running tests
  class Config
    # @return [String] server url
    attr_reader :server
    # @return [Symbol] browser
    attr_reader :browser
    # @return [String] language
    attr_reader :language

    def initialize(params = {})
      @server = params.fetch(:server, default_server)
      @language = params.fetch(:language, default_language)
      @browser = params.fetch(:browser, :chrome)
    end

    # @return [String] hash of site by url `help_center/revision or test run date`
    def help_center_version
      version_uri = URI("#{@server}/revision")
      revision_data = Net::HTTP.get(version_uri)
      if revision_data == "changelog.xml doesn't exist"
        Time.new.strftime('%d/%m/%Y')
      else
        revision_data.split[0]
      end
    rescue StandardError => e
      OnlyofficeLoggerHelper.log("Cannot get site hash because of #{e}")
      'unknown'
    end

    # @todo Change to true when HelpCenter will be fixed
    # Currently HelpCenter pages take too long to be fully loaded,
    # it is suspected that the reason is jQuery requests, loading time of which exceeds PageObject.default_page_wait
    # This is temporary fix, which should be changed to true when the issues will be handled
    def wait_for_js_load
      false
    end

    private

    # @return [String] server on which test are performed
    def default_server
      return 'https://helpcenter.onlyoffice.com/' if ENV.fetch('SPEC_REGION', 'unknown').include?('com')

      'https://test-helpcenter.onlyoffice.com/'
    end

    def default_language
      env_language = ENV.fetch('SPEC_LANGUAGE', 'unknown')
      return env_language if HelpCenterData.help_center_languages.include?(env_language)

      'en-US'
    end
  end
end
