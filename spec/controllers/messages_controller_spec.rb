require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

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
    @request.host = "lvh.me"
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: @asset.id }
      expect(response).to have_http_status(:success)
    end

    it "redirect to landing page if asset is invalid" do
      get :show, params: { id: "asbcd" }
      expect(response).to redirect_to "http://#{@request.host}/"
    end
  end

  describe "DELETE #destroy" do
    it "returns http success" do
      delete :destroy, params: {id: @asset.id}
      expect(response).to redirect_to "http://#{@request.host}/"
    end

    it "redirect to landing page if asset is invalid" do
      delete :destroy, params: { id: "asbcd" }
      expect(response).to redirect_to "http://#{@request.host}/"
    end
  end

end
