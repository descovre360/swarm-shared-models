module SwarmSharedModels
  class LicenseRequest < ApplicationRecord
    has_paper_trail
    scope :pending, -> {where(approved_at: nil, denied_at: nil)}
    scope :approved, -> {where.not(approved_at: nil)}

    has_one :approver, class_name: "User", foreign_key: :id, primary_key: :approved_by
    has_one :denier, class_name: "User", foreign_key: :id, primary_key: :denied_by
    has_one :revoker, class_name: "User", foreign_key: :id, primary_key: :revoked

    def generate_id
      # DO NOTHING. It's to override the uuid generation as id is integer type for this table
    end
  end
end