class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to root_path
    end
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end

  def omniauth
    binding.pry
    # user = User.find_or_create_by(uid: request.env['omniauth.auth'][:provider], provider: request.env['omniauth.auth'][:uid]) do |u|
    # end
  end
end
