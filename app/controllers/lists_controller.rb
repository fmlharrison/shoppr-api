class ListsController < ApplicationController
  before_action :set_shop
  before_action :set_shop_list, only: [:show]

  #GET /shops/:shop_id/list
  def show
    json_response(@list)
  end

  private

  def list_params
    params.permit(:total_capacity)
  end

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def set_shop_list
    @list = @shop.list if @shop
  end
end
