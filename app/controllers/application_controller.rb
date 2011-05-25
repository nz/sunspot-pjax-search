class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def pjax_request?
    !!request.headers['X-PJAX']
  end
  
end
