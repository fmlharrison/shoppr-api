class ItemsController < ApplicationController
  before_action :set_shop
  before_action :set_shop_list
  before_action :set_list_item, only: [:show, :update, :destroy]

  def index
    json_response(@list.items)
  end

  def create
    @item = @list.items.create!(item_params)
    json_response(@item, :created)
  end

  private

  def item_params
    params.permit(:name, :brand, :max_price, :quantity, :comment)
  end

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def set_shop_list
    @list = List.find(@shop.list) if @shop
  end

  def set_list_item
    @item = @list.items.find_by!(id: params[:id]) if @list
  end
end
