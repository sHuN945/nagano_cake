class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_item, only: [:show, :edit, :update]

  def new
    @item = Item.new

  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "You have created item successfully."
      redirect_to admin_item_path(@item)
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def index
    @customer = current_customer
    @items = Item.all
    @items = Item.page(params[:page]).per(10)
  end

  def show

  end

  def update
    if @item.update(item_params)
      flash[:notice] = "You have updated item successfully."
      redirect_to admin_item_path(@item)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :price)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
