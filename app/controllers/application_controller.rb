class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_admin!
    if admin_signed_in?
      super
    else
      redirect_to root_path, :notice => "That action is not allowed."
    end
  end
end
