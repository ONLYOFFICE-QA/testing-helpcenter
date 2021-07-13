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
      version_uri = URI("#{config.server}/revision")
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

    private

    # @return [String] server on which test are performed
    def default_server
      return 'https://helpcenter.onlyoffice.com/' if ENV['SPEC_REGION']&.include?('com')

      'https://test-helpcenter.onlyoffice.com/'
    end

    def default_language
      return ENV['SPEC_LANGUAGE'] if HelpCenterData.help_center_languages.include?(ENV['SPEC_LANGUAGE'])

      'en-US'
    end
  end
end
