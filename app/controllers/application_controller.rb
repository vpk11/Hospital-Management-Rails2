# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :set_current_user
  

  def current_user
    if session[:current_user_id].present?
      user=User.find(session[:current_user_id])
    else
      nil
    end
  end
  
  protected
  def set_current_user
    Authorization.current_user = current_user
  end
  



end
