Rails.application.routes.draw do
  # Routes for the Dish_list resource:
  # CREATE
  get "/dish_lists/new", :controller => "dish_lists", :action => "new"
  post "/create_dish_list", :controller => "dish_lists", :action => "create"

  # READ
  get "/dish_lists", :controller => "dish_lists", :action => "index"
  get "/dish_lists/:id", :controller => "dish_lists", :action => "show"

  # UPDATE
  get "/dish_lists/:id/edit", :controller => "dish_lists", :action => "edit"
  post "/update_dish_list/:id", :controller => "dish_lists", :action => "update"

  # DELETE
  get "/delete_dish_list/:id", :controller => "dish_lists", :action => "destroy"
  #------------------------------

  devise_for :user_login_details
  # Routes for the User_login_detail resource:
  # READ
  get "/user_login_details", :controller => "user_login_details", :action => "index"
  get "/user_login_details/:id", :controller => "user_login_details", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
