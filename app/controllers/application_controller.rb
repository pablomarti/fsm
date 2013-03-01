class ApplicationController < ActionController::Base
  
  protect_from_forgery

  before_filter :authenticate_user!
  before_filter :get_list

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  def get_list
  	@list = current_user.get_cases
    
  end

end
