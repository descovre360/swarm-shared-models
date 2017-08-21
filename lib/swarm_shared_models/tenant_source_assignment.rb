module SwarmSharedModels
  class TenantSourceAssignment < ApplicationRecord
    belongs_to :tenant
    belongs_to :source
  end
end
