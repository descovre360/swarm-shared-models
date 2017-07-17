module SwarmSharedModels
  class ReleaseNote < ApplicationRecord
    validates_presence_of :release_number
    validates_presence_of :notes

    belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  end
end
