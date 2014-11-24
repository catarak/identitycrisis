class GroupsController < ApplicationController
  def show
    #add a before filter to check if user is privileged to see group
    @group = Group.find(params[:id])
    @members = User.joins(:memberships).where(memberships: {group_id: params[:id]})
    @accounts = Account.where(group_id: params[:id])
    @user = User.new
  end

  def new
    @group = Group.new
    #@group.accounts.build
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to group_path(@group)
    end
  end

  private
    def group_params
      params.require(:group).permit(:name, accounts_attributes: [:name, :access_token, :access_token_secret])
    end
end
