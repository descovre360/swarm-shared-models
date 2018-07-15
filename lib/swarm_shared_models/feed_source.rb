module SwarmSharedModels
  class FeedSource < ApplicationRecord
    has_paper_trail
    validates_presence_of :name
    validates_presence_of :url
    validates_presence_of :feed_group

    validates_uniqueness_of :name

    belongs_to :feed_group
  end
end
