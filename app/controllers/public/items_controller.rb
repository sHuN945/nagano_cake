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
    cart_item = CartItem.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    cart_item.item_id = cart_item_params[:item_id]
    if CartItem.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = CartItem.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.update(amount: cart_item.amount)
      redirect_to cart_items_path, notice: 'カートに商品を追加しました。'
    else
      cart_item.save
      redirect_to cart_items_path
    end
  end
  
end
