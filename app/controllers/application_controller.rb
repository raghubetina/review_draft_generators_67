class ApplicationController < ActionController::Base
  before_action(:load_current_driver)
  before_action(:force_driver_sign_in)
  
  def load_current_driver
    @current_driver = Driver.where({ :id => session[:driver_id] }).at(0)
  end
  
  def force_driver_sign_in
    if @current_driver == nil
      redirect_to("/driver_sign_in", { :notice => "You have to sign in first." })
    end
  end

end
