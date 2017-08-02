module SwarmSharedModels
  class DashboardPane < ApplicationRecord
    belongs_to :user
    belongs_to :visualization
    belongs_to :folder
    belongs_to :feed_source
    delegate :tenant, to: :user

    validates :folder, presence: true, if: Proc.new { |a| a.feed_source_id.blank? }
    validates :visualization, presence: true, if: Proc.new { |a| a.feed_source_id.blank? }
    validates :feed_source, presence: true, if: Proc.new { |a| a.folder_id.blank? && a.visualization_id.blank? }
  end
end
