module SwarmSharedModels
  class Preference < ApplicationRecord
    has_many :user_preferences, dependent: :destroy
    scope :source, -> { where(pkey: 'SOURCE') }
    scope :page_size, -> { where(pkey: 'PGSIZE') }
    scope :default_visual, -> { where(pkey: 'DEFAULTVISUAL') }
  end
end
