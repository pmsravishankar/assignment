class AudLog < ApplicationRecord
  belongs_to :asset

  self.primary_keys = :rec_id, :sent_dttm

  scope :active, -> { where(del_flg: '0') }

  def mark_as_read
    update(view_sts: '1')
  end

  def set_as_disable
    update(del_flg: '1')
  end
end
