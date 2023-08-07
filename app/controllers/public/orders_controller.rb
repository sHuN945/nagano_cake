class Public::OrdersController < ApplicationController
  
  def index
    @customer = current_customer
    @items = @user.items
  end 
  
  def show
    @customer = current_customer
  end 
  
  def confirm
    @order = Order.new(order_params)
  end

  private
  def order_params
    params.require(:order).permit(:payment_method)
  end
end
