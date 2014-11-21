class SessionsController < ApplicationController

  def new
    redirect_to '/auth/twitter'
  end


  def create
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'],
      # finds new user or creates new user
      :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)

    reset_session
    session[:user_id] = user.id
    redirect_to root_url, :notice => 'Signed in!!'
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'You have signed out, thanks!'
  end

  def failure
    redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  end

end
