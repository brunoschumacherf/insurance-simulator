class ApiController < ActionController::API
  before_action :authenticate_user!, except: %i[signup signin]
end