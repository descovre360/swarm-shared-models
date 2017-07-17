module SwarmSharedModels
  class DashboardPane < ApplicationRecord
    belongs_to :user
    belongs_to :visualization
    belongs_to :folder
    delegate :tenant, to: :user
  end
end
