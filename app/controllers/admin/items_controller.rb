class Admin::ItemsController < ApplicationController
  def edit
    @item = Item.find(params[:id])
  end 
  
  def index
    @items = Item.all
  end 
  
  def show
    @item = Item.find(params[:id])
    @items = Item.all
  end
end
