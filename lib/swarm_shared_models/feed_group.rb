module SwarmSharedModels
  class FeedGroup < ApplicationRecord
    validates_presence_of :name
    validates_uniqueness_of :name

    has_many :feed_sources
  end
end
