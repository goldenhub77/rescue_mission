class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_by_auth(request.env['omniauth.auth'])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "Welcome, #{@user.name}"
      redirect_to questions_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have been signed out"
    redirect_to root_path
  end
end
