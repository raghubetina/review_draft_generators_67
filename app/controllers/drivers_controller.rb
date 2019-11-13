class DriversController < ApplicationController
  skip_before_action(:force_driver_sign_in, { :only => [:new_registration_form, :create] })
  
  def new_registration_form
    render({ :template => "driver_sessions/sign_up.html.erb" })
  end

  def create
    @driver = Driver.new
          
    @driver.email = params.fetch(:email, nil)
                      
    @driver.password = params.fetch(:password, nil)
    @driver.password_confirmation = params.fetch(:password_confirmation, nil)
                
    @driver.username = params.fetch(:username, nil)
                
    @driver.first_name = params.fetch(:first_name, nil)
                
    @driver.last_name = params.fetch(:last_name, nil)
                
    @driver.bio = params.fetch(:bio, nil)
                
    @driver.hired_on = params.fetch(:hired_on, nil)
          
    save_status = @driver.save

    if save_status == true
      session[:driver_id] = @driver.id
   
      redirect_to("/", { :notice => "Driver account created successfully."})
    else
      redirect_to("/driver_sign_up", { :alert => "Driver account failed to create successfully."})
    end
  end
    
  def edit_registration_form
    render({ :template => "drivers/edit_profile.html.erb" })
  end

  def update
    @driver = @current_driver
          
    @driver.email = params.fetch(:email, @driver.email)
                
    @driver.password = params.fetch(:password, nil)
    @driver.password_confirmation = params.fetch(:password_confirmation, nil)
                
    @driver.username = params.fetch(:username, @driver.username)
                
    @driver.first_name = params.fetch(:first_name, @driver.first_name)
                
    @driver.last_name = params.fetch(:last_name, @driver.last_name)
                
    @driver.bio = params.fetch(:bio, @driver.bio)
                
    @driver.hired_on = params.fetch(:hired_on, @driver.hired_on)
              
    if @driver.valid?
      @driver.save

      redirect_to("/", { :notice => "Driver account updated successfully."})
    else
      render({ :template => "drivers/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_driver.destroy
    reset_session
    
    redirect_to("/", { :notice => "Driver account cancelled" })
  end
  
end
