class Config < ApplicationRecord
  belongs_to :asset

  self.primary_keys = :cust_id, :ntftn_id

  scope :active, -> { where(actv_sts: '1') }
end
