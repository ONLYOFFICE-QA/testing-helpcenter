# frozen_string_literal: true

require 'yaml'

module TestingHelpCentreOnlyoffice
  # Help Center data
  class HelpCenterData
    def self.help_center_languages
      %w[en-US de-DE fr-FR es-ES ru-RU it-IT]
    end

    def self.try_in_the_cloud_button_translate
      {
        'en-US': 'TRY IN THE CLOUD',
        'de-DE': 'IN DER CLOUD TESTEN',
        'fr-FR': 'ESSAYER DANS LE CLOUD',
        'es-ES': 'PRUÉBELO EN LA NUBE',
        'ru-RU': 'ПОПРОБОВАТЬ В ОБЛАКЕ',
        'it-IT': 'PROVALO NEL CLOUD'
      }
    end

    def self.main_page_links
      ['Installation', 'Administration', 'Integration', 'User Guides', 'Contribution', 'Development']
    end

    def self.main_page_block_links
      @main_page_block_links ||= YAML.load_file("#{__dir__}/main_page_block_info.yml")
    end

    def self.footer_links
      @footer_links ||= YAML.load_file("#{__dir__}/footer_links_info.yml")
    end

    def self.main_page_faq_info
      {
        'What license is ONLYOFFICE distributed under?': ['ONLYOFFICE Legal Notices and Terms of Use'],
        'What is the difference between Community Edition and Enterprise Edition?': ['Comparison of Community Edition and Enterprise Edition'],
        'How can I upgrade from Community Edition to Enterprise Edition?': ['ONLYOFFICE Docs', 'ONLYOFFICE Workspace'],
        'Where can I request technical assistance?': ['SaaS', 'Server', 'Premium Support'],
        'I have a question that is not covered here. Where can I find answers to other questions?': ['ONLYOFFICE Help Center', 'ONLYOFFICE Docs', 'ONLYOFFICE Groups',
                                                                                                     'ONLYOFFICE Mail', 'ONLYOFFICE Talk', 'ONLYOFFICE Workspace', 'ONLYOFFICE Desktop Editors', 'Pricing']
      }
    end
  end
end
