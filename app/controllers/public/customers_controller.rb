class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
    @customer = current_customer
  end 
  
  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    @customer.update(customer_params)
    if @customer.update(customer_params)
      flash[:notice] = "You have updated customer successfully."
      redirect_to customer_path
    else
      render :edit
    end
    
    def unsubscribe
      @customer = current_customer
    end

    def withdrawal
      current_customer.update(status: 'withdrawal')
      reset_session
      redirect_to root_path, notice: '退会しました。'
    end
  end
  
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number)
  end
end
