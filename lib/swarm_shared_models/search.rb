module SwarmSharedModels
  class Search < ApplicationRecord
    has_paper_trail
    belongs_to :user
    belongs_to :project
  end
end