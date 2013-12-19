class Admin::CategoriesController < Admin::BaseController
  def index
    @cat_roots = Category.roots
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "Category updated."
      redirect_to :controller => 'admin/categories', :action => 'show', :id => @category
    else
      render 'edit'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "Category deleted."
    redirect_to admin_categories_url
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category created."
      redirect_to :controller => 'admin/categories', :action => 'show', :id => @category
    else
      render 'new'
    end
    #respond_to  do |format|
    #  format.html { render :layout=>false }
    #end
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

end
