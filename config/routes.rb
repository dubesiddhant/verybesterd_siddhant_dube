Rails.application.routes.draw do
  devise_for :user_login_details
  # Routes for the User_login_detail resource:
  # READ
  get "/user_login_details", :controller => "user_login_details", :action => "index"
  get "/user_login_details/:id", :controller => "user_login_details", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
