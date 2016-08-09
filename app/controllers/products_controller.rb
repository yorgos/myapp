class ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    # Here we create an instance variable @products
    # and we asign to it all the contents of the array Product which is in the model
    # in order to be able to reference it in the dynamic html views
    # @products = Product.all

    # Conditional search. Depending on the environment where the search is applied at (production/development) we use a diferent SQL maching method
    # the LIKE sql method is case sensitive in the development environment
    # the ILIKE sql method is not case sensitive and it is going to be used for the production environment
    # If there is no search then all the products are going to be displayed.
    if Rails.env.development? && params[:q]
      search_term = params[:q]
      @products = Product.where("name LIKE ?", "%#{search_term}%")
    elsif Rails.env.production? && params[:q]
      search_term = params[:q]
      @products = Product.where("name ILIKE ?", "%#{search_term}%")
    else
      @products = Product.all
    end

  end

  # GET /products/1
  # GET /products/1.json
  def show
    @comments = @product.comments.order("created_at DESC")
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :colour, :image_url, :price)
    end
end
