class ListsController < ApplicationController
  before_action :set_shop
  before_action :set_shop_list, only: [:show, :update, :destroy]

  #GET /shops/:shop_id/list
  def show
    json_response(@list)
  end

  def create
    @list = @shop.create_list!(list_params)
    json_response(@list, :created)
  end

  def update
    @list.update(list_params)
    head :no_content
  end

  def destroy
    @list.destroy
    head :no_content
  end

  private

  def list_params
    params.permit(:total_capacity, :shop_id)
  end

  def set_shop
    @shop = Shop.find(params[:shop_id])
  end

  def set_shop_list
    @list = List.find(@shop.list) if @shop
  end
end
