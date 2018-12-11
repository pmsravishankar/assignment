require 'rails_helper'

RSpec.describe "messages/index.haml", type: :view do
  it "render" do
    @asset = FactoryGirl.create(:asset)
    @assets = Asset.all_assets
    assign(:assets, @assets)
    render
    expect(rendered).to include("<h1>Messages</h1>")
  end
end
