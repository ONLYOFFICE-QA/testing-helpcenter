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

    def self.integration_links
      {
        'Alfresco': 'navitem_integration_alfresco',
        'Confluence': 'navitem_integration_confluence',
        'HumHub': 'navitem_integration_hh',
        'Liferay': 'navitem_integration_liferay',
        'Nextcloud': 'navitem_integration_nextcloud',
        'Nuxeo': 'navitem_integration_nuxeo',
        'ownCloud': 'navitem_integration_ownclooud',
        'Plone': 'navitem_integration_plone',
        'SharePoint': 'navitem_integration_share'
      }
    end

    def self.installation_links
      {
        'ONLYOFFICE Workspace': 'navitem_workspace',
        'Workspace': 'navitem_opensource',
        'Workspace Enterprise Edition': 'navitem_enterprise',
        'Workspace Cloud Service': 'navitem_cloud',
        'ONLYOFFICE Groups': 'navitem_community',
        'ONLYOFFICE Mail': 'navitem_mail',
        'ONLYOFFICE Talk': 'navitem_talk',
        'ONLYOFFICE Docs': 'navitem_document',
        'Community Edition': 'navitem_document_ce',
        'Enterprise Edition': 'navitem_document_ee',
        'Developer Edition': 'navitem_document_de',
        'ONLYOFFICE Desktop Editors': 'navitem_desktop_install',
        'ONLYOFFICE Mobile Apps': 'navitem_mobile_install'
      }
    end

    def self.user_guides_links
      {
        'ONLYOFFICE Docs': 'F',
        'Document Editor': 'navitem_userguide_de',
        'Spreadsheet Editor': 'navitem_userguide_se',
        'Presentation Editor': 'navitem_userguide_pe',
        'ONLYOFFICE Workspace': 'navitem_userguides_workspace',
        'Groups': 'navitem_userguides_workspace_groups',
        'Docs': 'navitem_userguides_workspace_docs',
        'Mail': 'navitem_userguides_workspace_mail',
        'Talk': 'navitem_userguides_talk',
        'ONLYOFFICE Groups': 'navitem_modules',
        'Documents': 'navitem_userguides_documents',
        'People': 'navitem_userguides_people',
        'Community': 'navitem_userguides_community',
        'CRM': 'navitem_userguides_crm',
        'Projects': 'navitem_userguides_projects',
        'Calendar': 'navitem_userguides_calendar',
        'ONLYOFFICE Mobile Apps': 'navitem_mobile_app',
        'Documents app for iOS': 'navitem_mobile_docs_ios',
        'Documents app for Android': 'navitem_mobile_docs_android',
        'Mobile web editors for iOS': 'navitem_mobile_web_docs_ios',
        'Mobile web editors for Android': 'navitem_mobile_web_docs_android',
        'Projects for iOS': 'navitem_mob_proj'
      }
    end
  end
end
