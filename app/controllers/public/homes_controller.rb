class Public::HomesController < ApplicationController
  def top
    @customer = current_customer
    @items = Item.page(params[:page]).per(4)
    @items = Item.all
  end
end
