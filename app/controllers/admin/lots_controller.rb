class Admin::LotsController < Admin::BaseController
  before_action :set_lot, only: [:show, :edit, :update, :destroy]

  def index
    @lots = Lot.all
  end

  def show
  end

  def new
    @lot = Lot.new
    @products = Product.all.map {|p| [p.name, p.id]}
  end

  def create
    @lot = Lot.new(lot_params)
    @lot.status = :not_started
    @lot.time_end = Time.now

    if @lot.save
      flash[:success] = "Lot created."
      redirect_to [:admin, @lot]
    else
      render 'new'
    end
  end

  def edit
    @products = Product.all.map {|p| [p.name, p.id]}
  end

  def update
    if @lot.update_attributes(lot_params)
      flash[:success] = "Lot updated."
      redirect_to [:admin, @lot]
    else
      render 'edit'
    end
  end

  def destroy
    @lot.destroy
    flash[:success] = "Lot deleted."
    redirect_to admin_lots_url
  end

  private
    def lot_params
      params.require(:lot).permit(:product_id, :min_bet, :time_step, :bet_step)
    end

    def set_lot
      @lot = Lot.find(params[:id])
    end
end
