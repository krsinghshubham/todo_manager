class ApplicationController < ActionController::Base
  before_action :ensure_user_logged_in

  def ensure_user_logged_in
    unless current_user
        # halt the request cycle
        
      redirect_to "/"
    end
  end

  def current_user
    # memoization: to do this task of grabbing session id from db only once.
    return @current_user if @current_user
    #note: between two indepedent requests these two instance variables are not shared.
    current_user_id = session[:current_user_id] # collect
    if current_user_id
      @current_user = User.find(current_user_id) #return the user
    else
      nil
    end
  end
end
