# frozen_string_literal: true

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
  end
end
