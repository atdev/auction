class Admin::ProductsController < Admin::BaseController
  def index
    @products = Product.all
  end

  def new
    @cat_array = Category.all.map { |c| [c.name, c.id] }
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Product created."
      redirect_to :controller => 'admin/products', :action => 'show', :id => @product
    else
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @cat_array = Category.all.map { |c| [c.name, c.id] }
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      flash[:success] = "Product updated."
      redirect_to :controller => 'admin/products', :action => 'show', :id => @product
    else
      render 'edit'
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Product deleted."
    redirect_to admin_products_url
  end

  private
    def product_params
      params.require(:product).permit(:name, :shop_price, :image, :description, :category_id)
    end
end
