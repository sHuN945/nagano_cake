class Public::OrdersController < ApplicationController
  
  def index
    @customer = current_customer
    @items = @user.items
  end 
  
  def show
    @customer = current_customer
  end 
end
