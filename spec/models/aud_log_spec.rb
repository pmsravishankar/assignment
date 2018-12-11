require 'rails_helper'

RSpec.describe AudLog, type: :model do

  before(:each) do
    @asset = FactoryGirl.create(:asset)
    @config = FactoryGirl.create(:config,
                                cust_id: 1,
                                ntftn_id: 1,
                                loan_nbr: "MyString",
                                actv_sts: "1",
                                asset_id: @asset.id)

    @aud_log = FactoryGirl.create(:aud_log,
                                rec_id: 1,
                                sent_dttm: Time.now,
                                cust_id: 1,
                                loan_nbr: @config.loan_nbr,
                                chnl: "MyString",
                                view_sts: "0",
                                sent_to: "MyString",
                                del_flg: "0",
                                ver_nbr: 1,
                                asset_eff_dt: @asset.eff_dt,
                                asset_id: @asset.id)

    @asset.reload
    @config.reload
    @aud_log.reload
  end

  it "all active aud_logs?" do
    aud_logs = AudLog.active
    expect(aud_logs.map(&:del_flg).uniq).to eq(['0'])
  end

  it "message has viewd?" do
    @aud_log.mark_as_read
    @aud_log.reload

    expect(@aud_log.view_sts).to eq("1")
  end

  it "message has deleted?" do
    @aud_log.set_as_disable
    @aud_log.reload

    expect(@aud_log.del_flg).to eq("1")
  end

end
