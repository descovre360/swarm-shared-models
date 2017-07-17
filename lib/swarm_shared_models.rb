module SwarmSharedModels
  VERSION = "0.1.0"
  # Your code goes here...
  autoload :Tenant, 'swarm_shared_models/tenant'
  autoload :History, 'swarm_shared_models/history'
  autoload :Preference, 'swarm_shared_models/preference'
  autoload :Permission, 'swarm_shared_models/permission'
  autoload :ReleaseNote, 'swarm_shared_models/release_note'
  autoload :Role, 'swarm_shared_models/role'
  autoload :SourceGroup, 'swarm_shared_models/source_group'
  autoload :Source, 'swarm_shared_models/source'
  autoload :VisualizationGroup, 'swarm_shared_models/visualization_group'
  autoload :Visualization, 'swarm_shared_models/visualization'
end
