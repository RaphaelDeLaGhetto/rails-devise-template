class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include SessionsHelper

  # For Devise
  # 2015-8-26
  # RSB: http://stackoverflow.com/questions/28804532/undefined-local-variable-or-method-current-user-using-devise-rails-3-2
#  before_filter :set_current_agent
#
#  def set_current_agent
#    Agent.current_agent = current_agent
#  end
end
