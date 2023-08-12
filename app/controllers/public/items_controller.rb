class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8)
    @items = Item.all
    @customer = current_customer
  end
  
  def show
    @item = Item.find(params[:id])
    @customer = current_customer
    @cart_item = CartItem.new
  end
  
  def create
    @item = Item.find(cart_item_params[:item_id])
    increase_or_create(params[:cart_item][:item_id])
    redirect_to cart_items_path, notice: 'カートに商品を追加しました。'
  end

  
end
