module SwarmSharedModels
  class VisualizationGroup < ApplicationRecord
    has_paper_trail
    validates_presence_of :name
    validates_uniqueness_of :name

    has_many :visualizations, dependent: :destroy
  end
end
