class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :update_sanitized_params, if: :devise_controller?

  helper_method :correct_user?

  private

    def correct_user?
      @user = User.find(params[:id])
      unless current_user == @user
        redirect_to root_url, :alert => "Access denied!!"
      end
    end

    def update_sanitized_params
      devise_parameter_sanitizer.for(:sign_up) << :first_name << :last_name
      devise_parameter_sanitizer.for(:account_update) << :first_name << :last_name
    end

    def current_member?
      @is_member = User.joins(:memberships).where(memberships: {group_id: params[:id]}).find_by(memberships: {user_id:current_user.id})
      if !@is_member
        redirect_to root_url, :alert => "You are not part of this group!!"
      end
    end

end
