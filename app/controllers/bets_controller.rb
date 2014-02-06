class BetsController < ApplicationController

  def create
    lot_id = params[:lot_id]
    @bet = Bet.new(lot_id: lot_id)
    if @bet.save
      respond_to do |format|
        format.js { }
      end
    end
  end

end
