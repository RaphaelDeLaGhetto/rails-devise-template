class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  #
  # cancan
  #
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    if agent_signed_in?
      redirect_to root_url
    else
      redirect_to login_url
    end
  end

  # Alias cancan's `current_user` method 
  alias_method :current_user, :current_agent
end
