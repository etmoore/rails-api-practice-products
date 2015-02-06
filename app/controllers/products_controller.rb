class ProductsController < ApplicationController

  def index
    render json: {products: Product.all.map{|product| product_json(product)}}
  end

  def create
    new_product = Product.new(product_params)
    if new_product.save
      render json: {product: product_json(new_product)}
    else
      render json: {errors: product.errors}, status: 422
    end
  end

  def show
    product = Product.find_by(id: params[:id])
    render json: {product: product_json(product)}
  end

  def update
    product = Product.find_by(id: params[:id])
    if product.update(product_params)
      render json: {product: product_json(product)}
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    if product.destroy
      head :no_content
    end
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :price_in_cents)
    end

    def product_json product
      {
        id: product.id,
        name: product.name,
        description: product.description,
        price_in_cents: product.price_in_cents
      }
    end

end
