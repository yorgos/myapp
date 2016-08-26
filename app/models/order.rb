class Order < ApplicationRecord
  # Database relationships
  # Since we have a foreign key on our orders table referencing the product_id, 
  # this relationship is called belongs_to , as in, “Order model belongs to Product model
  belongs_to :product
  belongs_to :user
end
