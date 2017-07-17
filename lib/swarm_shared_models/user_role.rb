module SwarmSharedModels
    class UserRole < ApplicationRecord
    validates_presence_of :user_id
    validates_presence_of :role_id

    belongs_to :user
    belongs_to :role
  end
end
