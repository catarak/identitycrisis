class Users::InvitationsController < Devise::InvitationsController
  def new
    @group = Group.find(params[:group_id])
    self.resource = resource_class.new
    render :new
  end

  def create
    self.resource = invite_resource
    resource_invited = resource.errors.empty?

    yield resource if block_given?

    #this is broken since we are making an ajax call
    if resource_invited
      Membership.create(user_id: self.resource.id, group_id: params[:group_id], role: :regular)
      @group = Group.find(params[:group_id])
      @user = self.resource
    else
      respond_with_navigational(resource) { render :new }
    end
  end
end