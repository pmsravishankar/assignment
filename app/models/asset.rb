class Asset < ApplicationRecord
  has_one :config, dependent: :destroy
  has_one :aud_log, dependent: :destroy

  scope :get_asset, -> (id) { where(id: id) }
  scope :all_assets, -> { joins(:config, :aud_log).merge(Config.active).merge(AudLog.active) }

  def update_view_status
    aud_log.mark_as_read
  end

  def delete_aud_log
    aud_log.set_as_disable
  end
end
