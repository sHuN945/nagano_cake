class CustomersController < ApplicationController
  
  def show
    @items = Item.all.page(params[:page]).per(8)
  end
end
