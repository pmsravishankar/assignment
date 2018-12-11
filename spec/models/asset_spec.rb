require 'rails_helper'

RSpec.describe Asset, type: :model do

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

  it "check customer is active?" do
    expect(@config.actv_sts).to eq("1")
  end

  it "view status is true if customer has viewed the message" do
    @asset.update_view_status
    @aud_log.reload

    expect(@aud_log.view_sts).to eq("1")
  end

  it "del_flg is true if customer has delete the message" do
    @asset.delete_aud_log
    @aud_log.reload

    expect(@aud_log.del_flg).to eq("1")
  end

  it "get asset by id" do
    asset = Asset.get_asset(@asset.id).first

    expect(asset.id).to eq(@asset.id)
  end

end
