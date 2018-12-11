require 'rails_helper'

RSpec.describe Config, type: :model do

  before(:each) do
    @asset = FactoryGirl.create(:asset)
    @config = FactoryGirl.create(:config,
                                cust_id: 1,
                                ntftn_id: 1,
                                loan_nbr: "MyString",
                                actv_sts: "1",
                                asset_id: @asset.id)
  end

  it "all active configs?" do
    configs = Config.active
    expect(configs.map(&:actv_sts).uniq).to eq(['1'])
  end

  it "no active configs?" do
    Config.update_all(actv_sts: "0")
    configs = Config.active
    expect(configs.map(&:actv_sts).empty?).to be_truthy
  end

end
