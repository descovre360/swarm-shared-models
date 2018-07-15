module SwarmSharedModels
  class SourceGroup < ApplicationRecord
    has_paper_trail
    validates_presence_of :name
    validates_uniqueness_of :name

    has_many :sources
  end
end
