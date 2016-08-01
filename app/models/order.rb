class Order < ApplicationRecord

  # Since we have a foreign key on our orders table referencing the product_id, this relationship is called belongs_to , as in, “Order model belongs to Product model
  belongs_to :product
end
