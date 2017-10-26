class ShopsController < ApplicationController
  # GET /shops
  def index
    @shops = Shop.all
    json_response(@shops)
  end

  private

  def shop_params
    params.permit(:location, :date, :type, :shopper)
  end
end
