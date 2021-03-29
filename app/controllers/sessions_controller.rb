class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if (user && user.authenticate(params[:password])) # also password only if user exists.
      render plain: " ok "
    else
      render plain: "wrong"
    end
  end
end
