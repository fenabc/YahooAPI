class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      log_in user
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to "sessions#new"
  end
end
