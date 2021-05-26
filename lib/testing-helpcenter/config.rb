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

    def test_plan_name
      "Help center domain: #{@server}, Version: #{version}"
    end

    def version
      Time.new.strftime('%d/%m/%Y')
    end

    private

    # @return [String] server on which test are performed
    def default_server
      return 'https://helpcenter.onlyoffice.com/' if ENV['SPEC_REGION']&.include?('com')

      'https://test-helpcenter.onlyoffice.com/'
    end

    def default_language
      return ENV['SPEC_LANGUAGE'] if HelpCenterData.site_languages.include?(ENV['SPEC_LANGUAGE'])

      'en-US'
    end
  end
end
