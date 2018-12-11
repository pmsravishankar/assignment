require 'rails_helper'

RSpec.describe "messages/show.haml", type: :view do
  it "render" do
    @asset = FactoryGirl.create(:asset)
    assign(:asset, @asset)
    render
    expect(rendered).to include(@asset.title)
  end
end
