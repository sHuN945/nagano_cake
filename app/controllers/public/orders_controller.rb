class Public::OrdersController < ApplicationController
  
  
  def new
    @order = Order.new
    @customer = current_customer
    @addresses = Address.all
  end 
  
  def index
    @customer = current_customer
    @items = current_customer.cart_items
    @orders = current_customer.orders.all.page(params[:page]).per(6).order('created_at DESC')
  end 
  
  def show
    @customer = current_customer
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end 
  
  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name
    end
    @cart_items = current_customer.cart_items
    @order_new = Order.new
    render :confirm
  end
  
  def create
    order = Order.new(order_params)
    order.save
    @cart_items = current_customer.cart_items.all
    
    @cart_items.each do |cart_item|
      @order_details = OrderDetail.new
      @order_details.order_id = order.id
      @order_details.item_id = cart_item.item.id
      @order_details.price = cart_item.item.price
      @order_details.quantity = cart_item.amount
      @order_details.save!
    end
    
    @cart_items.destroy_all
    redirect_to orders_completed_path

  end
  
  def completed
  end
  

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :total_payment, :name, :postage, :amount_requested, :customer_id)
  end
  
 
end
