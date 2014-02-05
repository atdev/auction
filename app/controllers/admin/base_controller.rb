class Admin::BaseController < ActionController::Base
  before_action :require_admin
  layout "sb_admin2"

  private
    def require_admin
      unless user_signed_in? && current_user.is_admin?
        flash[:alert] = "You must be logged in as admin to access this section"
        redirect_to root_path # halts request cycle
      end
    end
end
