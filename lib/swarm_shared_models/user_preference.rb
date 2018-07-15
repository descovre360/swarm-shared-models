module SwarmSharedModels
  class UserPreference < ApplicationRecord
    has_paper_trail
    validates_presence_of :user
    validates_presence_of :preference

    belongs_to :user
    belongs_to :preference

    scope :source_preferences, -> { where(preference: Preference.source) }
    scope :page_size_preferences, -> { where(preference: Preference.page_size) }
    scope :default_visual_preferences, -> { where(preference: Preference.default_visual) }
  end
end
