class Admin::CategoriesController < Admin::BaseController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.roots
  end

  def show
    @categories = @category.children
  end

  def new
    parent_id = params[:parent_id]
    if parent_id
      @category = Category.new(parent_id: parent_id)
    else
      @category = Category.new
    end
    @category.build_picture
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category created."
      redirect_to [:admin, @category]
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update_attributes(category_params)
      flash[:success] = "Category updated."
      redirect_to [:admin, @category]
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    flash[:success] = "Category deleted."
    redirect_to admin_categories_url
  end

  private
    def category_params
      params.require(:category).permit(:name, :parent_id, picture_attributes: [:image])
    end

    def set_category
      @category = Category.find(params[:id])
    end

end
