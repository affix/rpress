class SessionsController < ApplicationController
  def new
  end

  def create
    user = Author.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "You are now logged in"
    else
      flash[:notice] = "Invalid email/password"
      render 'new'
    end
  end
end
