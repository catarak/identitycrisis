class VisitorsController < ApplicationController

  skip_before_filter :authenticate_user!

  def index
    if user_signed_in?
      #move this to User model
      @my_groups = Group.joins(:memberships).where(memberships: {user_id: current_user.id})
    end
  end

end
