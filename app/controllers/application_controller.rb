class ApplicationController < ActionController::Base
  include SessionsHelper

  private
  def logged_in_user
    unless logged_in?
      redirect_to "sessions#new"
    end
  end
end
