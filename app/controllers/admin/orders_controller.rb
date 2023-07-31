class Admin::OrdersController < ApplicationController
  
def show
  @customer = current_customer
  @item = Item.find(params[:id])
end 

end
