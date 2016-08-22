class Comment < ApplicationRecord

  # Validations
  validates :body, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, numericality: { only_integer: true }

  # Call job when everything that needs to be done before has been executed
  # after_create_commit will run any code between the { } parentheses after a comment has been created. perform_later will enqueue the job and run it when it's its turn (after all previously enqueued jobs.)
  after_create_commit { CommentUpdateJob.perform_later(self, @user) }


  # Database relationships
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
