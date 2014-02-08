class BetsController < ApplicationController
  before_action :redirect_guest, only: :create
  before_action :user_has_bets, only: :create

  def create
    lot_id = params[:lot_id]
    user_id = current_user.id
    @bet = Bet.new(lot_id: lot_id, user_id: user_id)
    if @bet.save
      respond_to do |format|
        format.js { }
      end
    end
  end

  private
    def redirect_guest
      unless user_signed_in?
        flash[:sign_in_make_bet] = "User should sign in to make a bet!"
        respond_to do |format|
          format.js { js_redirect new_user_session_path }
        end
      end
    end

    def user_has_bets # will rewrite in the future
      unless current_user.bets_count && current_user.bets_count > 0
        flash[:should_has_bets] = "User must have bets in his account for betting!"
        respond_to do |format|
          format.js { js_redirect lots_path }
        end
      end
    end

    def js_redirect(path)
      render js: %(window.location.href='#{path}')
    end

end
