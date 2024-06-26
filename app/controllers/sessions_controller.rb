class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if (user && user.authenticate(params[:password])) # also password only if user exists.
      session[:current_user_id] = user.id #when we are signed we are setting the session with current user id.
      redirect_to todos_path
    else
      flash[:error] = "Your login attempt was invalid. Please retry."
      redirect_to new_sessions_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to "/"
  end
end
