class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  def soft_delete  
    update_attribute(:deleted_at, Time.current)  
  end
  
  def active_for_authentication?  
    super && !deleted_at  
  end  
  
  def inactive_message   
    !deleted_at ? super : :deleted_account  
  end 
end
