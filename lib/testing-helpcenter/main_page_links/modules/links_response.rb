# frozen_string_literal: true

module TestingHelpCentreOnlyoffice
  # Check link response answer
  module LinksResponse
    # @param link [String] link url to check
    # @return [True] if responce is successfully 2xx, or raise an exception
    def link_success_response?(link)
      response = HTTParty.head(link).response.code
      @instance.webdriver.webdriver_error("Link `#{link}` answered with #{response}") unless response.start_with?('2')
      true
    end
  end
end
