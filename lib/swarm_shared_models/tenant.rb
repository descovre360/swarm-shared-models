module SwarmSharedModels
  class Tenant < ApplicationRecord
    has_many :users
    has_many :user_visits, through: :users

    def owner
      owner_user_role = UserRole.where(role_id: Role.where(name: 'Owner').first.id, user_id: users.pluck(:id)).first
      owner_user_role && owner_user_role.user
    end

    def owners
      UserRole.where(role_id: Role.where(name: 'Owner').first.id, user_id: users.pluck(:id)).includes(:user).map{|user_role| user_role.user}
    end

    def tenant_users
      UserRole.where(tenant_id: self.id).uniq
    end

  end
end
