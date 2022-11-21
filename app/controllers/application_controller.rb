class ApplicationController < ActionController::API
  devise_group :user, contains: %i[admin user]
end
