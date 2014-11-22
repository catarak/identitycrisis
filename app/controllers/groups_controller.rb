class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
    @members = User.joins(:memberships).where(memberships: {group_id: params[:id]})
    @accounts = Account.where(group_id: params[:id])
  end
end
