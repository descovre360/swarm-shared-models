module SwarmSharedModels
  class TenantSourceAssignment < ApplicationRecord
    has_paper_trail
    belongs_to :tenant
    belongs_to :source
  end
end
