module SwarmSharedModels
  class Project < ApplicationRecord
    has_many :searches, dependent: :destroy
    belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  end
end