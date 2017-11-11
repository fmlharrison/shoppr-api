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

  #POST /shops
  def create
    @shop = Shop.create!(shop_params)
    json_response(@shop, :created)
  end

  private

  def shop_params
    params.permit(:location, :date, :shop_kind, :shopper)
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end
end
