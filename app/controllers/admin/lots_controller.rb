class Admin::LotsController < Admin::BaseController
  before_action :set_lot, only: [:show, :edit, :update, :destroy]
  before_action :set_time_start, only: [:update] # temp

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
      if is_starting? # temp
        @lot.time_end = @lot.time_start + @lot.time_step
        @lot.save
      end
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
      params.require(:lot).permit(:product_id, :time_step, :bet_step, :start_price, :status)
    end

    def set_lot
      @lot = Lot.find(params[:id])
    end

    def is_starting? #I don't like this idea
      prev_status = @lot.status
      current_status = params[:lot][:status]
      starting =  prev_status.to_s == 'not_started' && current_status == 'started'
      if starting
        return true
      else
        return false
      end
    end

    def set_time_start # temp
      @lot.time_start = Time.now if is_starting?
    end
end
