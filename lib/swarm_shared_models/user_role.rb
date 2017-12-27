module SwarmSharedModels
    class UserRole < ApplicationRecord
    validates_presence_of :user_id
    validates_presence_of :role_id

    attr_accessor :current_user_id

    belongs_to :user
    belongs_to :role

    #before_save :check_for_current_user_id

    after_save :set_owner_dependency_roles, if: Proc.new { |user_role| user_role.role_id == Role::OWNER_USER_ROLE.id }
    after_save :set_full_user_dependency_roles, if: Proc.new { |user_role| user_role.role_id == Role::FULL_USER_ROLE.id }
    after_save :set_viewer_dependency_roles, if: Proc.new { |user_role| user_role.role_id == Role::VIEWER_USER_ROLE.id }

    def set_owner_dependency_roles
        return if user.is_full_user?
        self.class.create(user_id: user_id, role_id: Role::FULL_USER_ROLE.id, current_user_id: current_user_id)
    end

    def set_full_user_dependency_roles
        self.class.where(user_id: user_id, role_id: Role::VIEWER_USER_ROLE.id).destroy_all
        user = User.find(user_id)
        pending_license_request = user.license_requests.pending.last
        if pending_license_request
            pending_license_request.update(approved_by: current_user_id, approved_at: Time.now)
        else
            user.license_requests.create(user_id: user_id, requested: false, approved_by: current_user_id, approved_at: Time.now)
        end
    end

    def check_for_current_user_id
        raise 'Current user id is mandatory' if self.current_user_id.blank?
    end

    def self.destroy_full_user_role(user_id, current_user_id)
        where(user_id: user_id, role_id: Role::FULL_USER_ROLE.id).destroy_all
        adjust_full_user_dependencies(user_id, current_user_id)
    end

    def self.adjust_full_user_dependencies(user_id, current_user_id)
        where(user_id: user_id, role_id: Role::OWNER_USER_ROLE.id).destroy_all
        create_with(current_user_id: current_user_id).find_or_create_by(user_id: user_id, role_id: Role::VIEWER_USER_ROLE.id)
        user = User.find(user_id)
        user.license_requests.approved.last.update(revoked_by: current_user_id, revoked_at: Time.now)
    end

    def set_viewer_dependency_roles; end
  end
end
