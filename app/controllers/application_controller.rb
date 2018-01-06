class ApplicationController < ActionController::Base
  before_action :authenticate_user_login_detail!

  protect_from_forgery with: :exception
end
