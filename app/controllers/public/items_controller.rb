class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8)
    @items = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
  end
end
