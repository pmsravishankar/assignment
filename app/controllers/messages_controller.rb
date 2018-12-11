class MessagesController < ApplicationController
  before_action :check_asset, except: [:index]

  def index
    @assets = Asset.all_assets.paginate(page: params[:page], per_page: 15).order("created_at")
  end

  def show
    @asset.update_view_status
  end

  def destroy
    @asset.delete_aud_log
    redirect_to root_path(page: params[:page])
  end

  private

  def check_asset
    @asset = Asset.get_asset(params[:id]).first
    redirect_to root_path and return unless @asset.present?
  end
end
