class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end 
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    if @customer.update(customer_params)
      flash[:notice] = "You have updated customer successfully."
      redirect_to customer_path
    else
      render :edit
    end
  end
  
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number)
  end
end
