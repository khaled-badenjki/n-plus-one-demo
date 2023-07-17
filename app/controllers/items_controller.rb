class ItemsController < ApplicationController
  def index
    # TODO: solve N+1 query problem
    @items = Item.all

    render json: @items
  end

  def show
    @item = Item.find_by_id(params[:id])
  end
end
