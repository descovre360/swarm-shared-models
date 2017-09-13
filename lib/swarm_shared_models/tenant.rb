module SwarmSharedModels
  class Tenant < ApplicationRecord
    has_many :users
    has_many :user_visits, through: :users
  end
end
