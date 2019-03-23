class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.all.order(created_at: :desc)
    @reviews = Review.where(product_id: @product.id)
  end

  def show
    @product = Product.find params[:id]
    @reviews = Review.where(product_id: @product.id).order("created_at DESC")
  end

end
