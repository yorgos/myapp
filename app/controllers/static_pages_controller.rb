class StaticPagesController < ApplicationController
  def index
  end

  def landing_page
    @products_limited = Product.limit(3)
    @products = Product.all
    #@featured_product = Product.first
  end
end
