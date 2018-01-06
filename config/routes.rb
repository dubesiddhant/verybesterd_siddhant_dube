Rails.application.routes.draw do
  # Routes for the Venue_detail resource:
  # CREATE
  get "/venue_details/new", :controller => "venue_details", :action => "new"
  post "/create_venue_detail", :controller => "venue_details", :action => "create"

  # READ
  get "/venue_details", :controller => "venue_details", :action => "index"
  get "/venue_details/:id", :controller => "venue_details", :action => "show"

  # UPDATE
  get "/venue_details/:id/edit", :controller => "venue_details", :action => "edit"
  post "/update_venue_detail/:id", :controller => "venue_details", :action => "update"

  # DELETE
  get "/delete_venue_detail/:id", :controller => "venue_details", :action => "destroy"
  #------------------------------

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
