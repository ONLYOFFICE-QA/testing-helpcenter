# frozen_string_literal: true

module TestingHelpCentreOnlyoffice
  # Help Center data for main page links
  class HelpCenterMainPageData
    def self.main_page_block_links
      {
        'Installation Guides': ['ONLYOFFICE Workspace', 'Workspace', 'Workspace Enterprise Edition', 'Workspace Cloud Service', 'ONLYOFFICE Groups', 'ONLYOFFICE Mail',
                                'ONLYOFFICE Talk', 'ONLYOFFICE Docs', 'Community Edition', 'Enterprise Edition', 'Developer Edition', 'ONLYOFFICE Desktop Editors', 'ONLYOFFICE mobile apps'],
        'Integration Guides': %w[Alfresco Confluence HumHub Liferay Nextcloud Nuxeo ownCloud Plone SharePoint],
        'Administration Guides': ['ONLYOFFICE Workspace', 'Managing portals', 'Reinforcing security', 'Configuring modules and tools', 'Customizing modules and tools',
                                  'Managing users', 'Connecting external services', 'ONLYOFFICE Control Panel'],
        'User Guides': ['ONLYOFFICE Workspace', 'General questions', 'ONLYOFFICE Groups', 'Documents', 'People', 'Community', 'CRM', 'Projects', 'Mail', 'Calendar',
                        'ONLYOFFICE Mail', 'ONLYOFFICE Talk', 'ONLYOFFICE Docs', 'Document Editor', 'Spreadsheet Editor', 'Presentation Editor', 'ONLYOFFICE mobile apps', 'Documents for iOS', 'Documents for Android', 'Projects for iOS', 'Web Editors'],
        'Developer Guides': ['ONLYOFFICE on GitHub', 'ONLYOFFICE Docs API', 'ONLYOFFICE Groups API', 'ONLYOFFICE Document Builder', 'Plugins and macros'],
        'Contribution Guides': ['Translation']
      }
    end

    def self.main_page_links
      ['Installation', 'Administration', 'Integration', 'User Guides', 'Contribution', 'Development']
    end
  end
end
