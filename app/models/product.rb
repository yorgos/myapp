class Product < ApplicationRecord

  #One product may be referenced by several orders because there might be a number of them in stock and multiple customers will want the same product. This is called a has_many relationship, as in “Product model has many orders”
  has_many :orders

end
