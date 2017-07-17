module SwarmSharedModels
  class History < ApplicationRecord
    self.table_name = 'history' # otherwise, it wants 'histories' which is weird

    validates_presence_of   :incoming_ip,
                            :user_id,
                            :true_user_id,
                            :activity

    belongs_to :user
    belongs_to :user, class_name: 'User', foreign_key: 'true_user_id'
  end
end
