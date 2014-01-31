class Admin::CategoriesController < Admin::BaseController
  #inherit_resources
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :categories2jstree

  def index
    @categories = Category.roots
  end

  def show
    @categories = @category.children
    respond_to do |format|
      format.js { js_redirect @category}
      format.html {}
    end
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
    @categories = Category.roots

    if @category.save
      flash[:success] = "Category created."
      redirect_to [:admin, @category]
    else
      render 'new'
    end
  end

  def edit
    @category.build_picture unless @category.picture
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
    def build_resource_params
      [params.fetch(:category, {}).permit(:name, :parent_id, picture_attributes: [:image])]
    end

    def category_params
      params.require(:category).permit(:name, :parent_id, picture_attributes: [:id, :image, :_destroy])
    end

    def set_category
      @category = Category.find(params[:id])
    end

    def js_redirect(path)
      render js: %(window.location.href='#{admin_category_path path}')
    end

    def categories2jstree
      @cat2jstree = Category.roots
    end
end
