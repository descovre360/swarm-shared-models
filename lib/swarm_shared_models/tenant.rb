module SwarmSharedModels
  class Tenant < ApplicationRecord
    has_paper_trail
    has_many :users
    has_many :user_visits, through: :users

    accepts_nested_attributes_for :users

    def owner
      owner_user_role = UserRole.where(role_id: Role.where(name: 'Owner').first.id, user_id: users.pluck(:id)).first
      owner_user_role && owner_user_role.user
    end

    def owners
      UserRole.where(role_id: Role.where(name: 'Owner').first.id, user_id: users.pluck(:id)).includes(:user).map{|user_role| user_role.user}
    end

    def sorted_users(sort_field_order = nil)
      sort_field_order = 'first_name_asc' if sort_field_order.blank?
      sort_type = sort_field_order.split('_').last
      sort_by = sort_field_order.split('_')[0..-2].join('_')
      unless sort_by == 'invite'
        ::User.where(tenant_id: id).order("#{sort_by} #{sort_type}")
      else
        ::User.where(tenant_id: id)
      end
    end

  end
end