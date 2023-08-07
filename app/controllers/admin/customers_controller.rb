class Admin::CustomersController < ApplicationController
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def index
    @customers = Customer.all
    @customers = Customer.page(params[:page]).per(10)
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "You have updated customer successfully."
      redirect_to admin_customer_path(@customer)
    else
      render :edit
    end
  end
  
    private

  def customer_params
    params.require(:customer).permit(:name, :image, :introduction, :price)
  end
  
end
