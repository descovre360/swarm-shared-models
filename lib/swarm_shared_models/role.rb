module SwarmSharedModels
  class Role < ApplicationRecord
    has_paper_trail
    validates_presence_of :name
    validates_uniqueness_of :name

    has_many :user_roles

    FULL_USER_ROLE = where(name: 'FullUser').first
    VIEWER_USER_ROLE = where(name: 'Viewer').first
    OWNER_USER_ROLE = where(name: 'Owner').first
  end
end
