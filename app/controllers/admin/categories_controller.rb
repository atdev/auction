class Admin::CategoriesController < Admin::BaseController
  inherit_resources

  def index
    @categories = Category.roots
  end

  def show
    @categories = resource.children
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

  private
    def build_resource_params
      [params.fetch(:category, {}).permit(:name, :parent_id, picture_attributes: [:image])]
    end
end
