class GroupsController < ApplicationController
  def show
    #add a before filter to check if user is privileged to see group
    @group = Group.find(params[:id])
    @members = User.joins(:memberships).where(memberships: {group_id: params[:id]})
    @accounts = Account.where(group_id: params[:id])
  end
end
