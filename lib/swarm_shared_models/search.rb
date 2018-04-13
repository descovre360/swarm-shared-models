module SwarmSharedModels
  class Search < ApplicationRecord
    belongs_to :user
    belongs_to :project
  end
end