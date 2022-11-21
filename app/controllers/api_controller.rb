class ApiController < ActionController::API
  before_action :check_user, except: %i[signup signin]
  
  def check_user
    return if current_user
  
    render json: { message: I18n.t('api.not_user') }, status: 401
  end
end