class BetsController < ApplicationController

  def create
    unless user_signed_in?
      redirect_guest
    else
      lot_id = params[:lot_id]
      user_id = current_user.id
      @bet = Bet.new(lot_id: lot_id, user_id: user_id)
      if @bet.save
        respond_to do |format|
          format.js { }
        end
      end
    end
  end

  private
    def redirect_guest
      unless user_signed_in?
        flash[:sign_in_make_bet] = "User should sign in to make a bet!"
        respond_to do |format|
          format.js { js_redirect }
        end
      end
    end

    def js_redirect
      render js: %(window.location.href='#{new_user_session_path}')
    end

end
