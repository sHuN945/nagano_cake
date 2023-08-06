class Public::CartItemsController < ApplicationController
  def index
    @items = Item.all
    @customer = current_customer

  end

  def destroy_all
    cart_items = CartItem.all
    cart_items.destroy_all
    flash[:notice] = "本当にカートを空にしますか？"
    redirect_to '/cart_items'
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

end
