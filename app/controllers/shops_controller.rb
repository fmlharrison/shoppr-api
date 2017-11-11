class ShopsController < ApplicationController
  before_action :set_shop, only: [:show]
  # GET /shops
  def index
    @shops = Shop.all
    json_response(@shops)
  end

  # GET /shops/:id
  def show
    json_response(@shop)
  end

  private

  def shop_params
    params.permit(:location, :date, :type, :shopper)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end
end
