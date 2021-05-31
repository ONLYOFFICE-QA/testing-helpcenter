# frozen_string_literal: true

module TestingHelpCentreOnlyoffice
  class ToolbarInfo

    def self.administration_links
      {
       'Managing portals': 'navitem_manageportals',
       'Reinforcing security': 'navitem_security',
       'Configuring modules and tools': 'navitem_configuring',
       'Customizing modules and tools': 'navitem_customizing',
       'Managing users': 'navitem_manageusers',
       'Connecting external services': 'navitem_externalservices',
       'ONLYOFFICE Control Panel': 'navitem_controlpanel'
      }
    end
  end
end