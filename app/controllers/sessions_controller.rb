class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if (user && user.authenticate(params[:password])) # also password only if user exists.
      session[:current_user_id] = user.id #when we are signed we are setting the session with current user id.
      render plain: " you are signed in "
    else
      render plain: "user-id/password combination was wrong"
    end
  end
end
