class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  # Scope used for displaying our comments in a descending order based on ranking
  # It allowes us to use <%= @product.comments.rating_desc.first %> in the view
  # instead of the more complicated <%= @product.comments.order(rating: :desc).first
  # This is exactly the same as defining a class method, and which you use is a matter of personal preference.

  #def self.rating_desc
  #  order(rating: :desc)
  #end

  scope :rating_desc, -> { order(rating: :desc) }

  # Scope used for displaying our comments in an ascending order based on ranking
  scope :rating_asc, -> { order(:rating) }
end
