class Admin::ProductsController < Admin::BaseController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
    @categories = Category.all.map {|c| [c.name, c.id] }
    @product.pictures.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Product created."
      redirect_to [:admin, @product]
    else
      render 'new'
    end
  end

  def edit
    @categories = Category.all.map {|c| [c.name, c.id] }
  end

  def update
    if @product.update_attributes(product_params)
      flash[:success] = "Product updated."
      redirect_to [:admin, @product]
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    flash[:success] = "Product deleted."
    redirect_to admin_products_url
  end

  private
    def product_params
      params.require(:product).permit(:name, :shop_price, :image, :description,
                                      :category_id, pictures_attributes: [:id, :image, :_destroy])
    end

    def set_product
      @product = Product.find(params[:id])
    end
end
