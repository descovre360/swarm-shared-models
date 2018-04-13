module SwarmSharedModels
  VERSION = "0.1.0"
  # Your code goes here...
  autoload :ApplicationRecord, 'swarm_shared_models/application_record'
  autoload :DashboardPane, 'swarm_shared_models/dashboard_pane'
  autoload :FeedGroup, 'swarm_shared_models/feed_group'
  autoload :FeedSource, 'swarm_shared_models/feed_source'
  autoload :History, 'swarm_shared_models/history'
  autoload :Permission, 'swarm_shared_models/permission'
  autoload :Preference, 'swarm_shared_models/preference'
  autoload :ReleaseNote, 'swarm_shared_models/release_note'
  autoload :Role, 'swarm_shared_models/role'
  autoload :SourceGroup, 'swarm_shared_models/source_group'
  autoload :Source, 'swarm_shared_models/source'
  autoload :Tenant, 'swarm_shared_models/tenant'
  autoload :TenantSourceAssignment, 'swarm_shared_models/tenant_source_assignment'
  autoload :UserPreference, 'swarm_shared_models/user_preference'
  autoload :UserRole, 'swarm_shared_models/user_role'
  autoload :VisualizationGroup, 'swarm_shared_models/visualization_group'
  autoload :Visualization, 'swarm_shared_models/visualization'
  autoload :UserVisit, 'swarm_shared_models/user_visit'
  autoload :LicenseRequest, 'swarm_shared_models/license_request'
  autoload :Project, 'swarm_shared_models/project'
  autoload :Search, 'swarm_shared_models/search'
end
