module SwarmSharedModels
  class SourceGroup < ApplicationRecord
    validates_presence_of :name
    validates_uniqueness_of :name

    has_many :sources
  end
end
