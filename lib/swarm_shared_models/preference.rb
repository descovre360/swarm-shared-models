module SwarmSharedModels
  class Preference < ApplicationRecord
    has_paper_trail
    has_many :user_preferences, dependent: :destroy
    scope :source, -> { where(pkey: 'SOURCE') }
    scope :page_size, -> { where(pkey: 'PGSIZE') }
    scope :default_visual, -> { where(pkey: 'DEFAULTVISUAL') }
    scope :sort_results_by, -> { where(pkey: 'SORT_RESULTS_BY') }
  end
end
