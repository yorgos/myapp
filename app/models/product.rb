class Product < ApplicationRecord

  # All new products are required to have a name
  validates :name, presence: true

  # Database relationships
  # One product may be referenced by several orders because there might be a number of them in stock and multiple customers will want the same product. This is called a has_many relationship, as in “Product model has many orders”
  has_many :orders
  has_many :comments

  # Method that selects the highest rating comment form the comments model using the scope :rating_desc inside the comments model
  def highest_rating_comment
    comments.rating_desc.first
  end

  # Method that selects the lowest rating comment form the comment model using the scope :rating_asc inside the comment model
  def lowest_rating_comment
    comments.rating_asc.first
  end

  # Method that extracts an average rating from the comments
  # The .average method always returns a floating point (A Ruby BigDecimal object)
  # With the .to_f method we are extracting the numerical value from the BigDecimal
  def average_rating
    comments.average(:rating).to_f
  end

end
