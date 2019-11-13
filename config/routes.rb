Rails.application.routes.draw do
  # Routes for signing up

  match("/driver_sign_up", { :controller => "drivers", :action => "new_registration_form", :via => "get"})
  
  # Routes for signing in
  match("/driver_sign_in", { :controller => "driver_sessions", :action => "new_session_form", :via => "get"})
  
  match("/driver_verify_credentials", { :controller => "driver_sessions", :action => "add_cookie", :via => "post"})
  
  # Route for signing out
  
  match("/driver_sign_out", { :controller => "driver_sessions", :action => "remove_cookies", :via => "get"})
  
  # Route for creating account into database 

  match("/post_driver", { :controller => "drivers", :action => "create", :via => "post" })
  
  # Route for editing account
  
  match("/edit_driver", { :controller => "drivers", :action => "edit_registration_form", :via => "get"})
  
  match("/patch_driver", { :controller => "drivers", :action => "update", :via => "post"})
  
  # Route for removing an account
  
  match("/cancel_driver_account", { :controller => "drivers", :action => "destroy", :via => "get"})


  #------------------------------

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
