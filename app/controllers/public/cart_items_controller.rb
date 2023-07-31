class Public::CartItemsController < ApplicationController
  def index
    @items = Item.all
    @customer = current_customer
  end

end
