module SwarmSharedModels
  class Visualization < ApplicationRecord
    has_paper_trail
    validates_presence_of :name
    validates_presence_of :visualization_group_id

    belongs_to :visualization_group
    has_many :dashboard_panes, dependent: :destroy
  end
end
