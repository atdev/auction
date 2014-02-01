class LotsController < ApplicationController
  
  def index
    @lots= Lot.order('created_at DESC').page(params[:page]).per_page(6)
  end

  def show
    @lot = Lot.find(params[:id])
  end




end
