module SwarmSharedModels
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true

    before_create :generate_id

    private

    # generate a new UUID id if the record needs one
    def generate_id
      self.id = SecureRandom.uuid if respond_to?(:id) && !attribute_present?(:id)
    end
  end
end
