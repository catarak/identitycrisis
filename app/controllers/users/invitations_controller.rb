class Users::InvitationsController < Devise::InvitationsController
  def create
    self.resource = invite_resource
    resource_invited = resource.errors.empty?

    yield resource if block_given?

    if !resource_invited
      respond_with_navigational(resource) { render :new }
    end
  end

end