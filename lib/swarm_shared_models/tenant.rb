module SwarmSharedModels
  class Tenant < ApplicationRecord
    has_many :users
    has_many :user_visits, through: :users

    def owner
      owner_user_role = UserRole.where(role_id: Role.where(name: 'Owner').first.id, user_id: users.pluck(:id)).first
      owner_user_role && owner_user_role.user
    end

  end
end
