module SwarmSharedModels
  class Source < ApplicationRecord
    validates_presence_of :name
    validates_presence_of :source_key
    validates_presence_of :source_group_id

    validates_uniqueness_of :name
    validates_uniqueness_of :source_key

    belongs_to :source_group

    scope :generic, -> {where.not(source_group_id: SourceGroup.where(name: 'Custom').first.id)}
    scope :by_source_group_name, -> { joins(:source_group).order('source_groups.name') }
  end
end
