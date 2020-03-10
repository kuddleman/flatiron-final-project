class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash.now[:notice] = "Product has been saved successfully"
      redirect_to root_path
    else
      flash[:alert] = "Product has not been saved. Please try again"
      render :new
    end
  end

  def edit
 
  end

  def update
    
    if @product.update(product_params)
      flash.now[:notice] = "Product has been updated successfully"
      redirect_to root_path
    else
      flash[:alert] = "Product has not been updated.  Please try again"
      render :edit
    end
  end

  def destroy
   
    @product.destroy
    redirect_to root_path
  end

  private

  def find_product
    begin
    @product = Product.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path
    end
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :image_url)
  end
    
end
