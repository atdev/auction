class LotsController < ApplicationController
  def index
    @lots = Lot.all
  end

  def show
  end

end
