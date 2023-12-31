class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def full_name
    self.last_name + " " + self.first_name
  end

  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, presence: true
  
  
  def active_for_authentication?
    super && (self.is_deleted == false)
  end

end
