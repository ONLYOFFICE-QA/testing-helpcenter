# frozen_string_literal: true

module TestingHelpCentreOnlyoffice
  # Help center helper for getting current hash
  class HelpCenterVersionHelper
    def self.fetch_uri
      URI("#{config.server}/revision")
    end

    # @return [String] hash of site by url `help_center/revision or test run date`
    def self.fetch_help_center_hash
      revision_data = Net::HTTP.get(fetch_uri)
      if revision_data == "changelog.xml doesn't exist"
        Time.new.strftime('%d/%m/%Y')
      else
        revision_data.split[0]
      end
    rescue StandardError => e
      OnlyofficeLoggerHelper.log("Cannot get site hash because of #{e}")
      'unknown'
    end
  end
end
