class Item < ApplicationRecord
  
  belongs_to :cart
  
  def with_tax_price
    (price * 1.1).floor
  end
  
end
