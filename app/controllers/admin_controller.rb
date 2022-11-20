class AdminController < ActionController::API
  before_action :check_admin

  def create_admin
    user = Admin.new(user_params)
    if user.save
      render json: { message: I18n.t('api.user_created') }, status: 200
    else
      render json: { message: user.errors.full_messages }, status: 422
    end
  end

  def login_admin
    user = Admin.find_by_email(params[:email])
    if user.valid_password?(params[:password])
      sign_in user, current_user
      render json: { message: I18n.t('api.admin_logged_in') }, status: 200
    else
      render json: { message: I18n.t('api.invalid_login') }, status: 401
    end
  end

  def get_users
    users = User.all
    render json: users
  end

  def get_user
    user = User.find(params[:id])
    render json: user
  end

  def get_insurances
    insurances = Insurance.all
    render json: insurances
  end

  def get_insurance
    insurance = Insurance.find(params[:id])
    render json: insurance
  end

  def check_admin
    return if current_user.is_a? Admin

    render json: { message: I18n.t('api.not_admin') }, status: 401
  end

  def simulate
    user = User.find(params[:id])
    render json: { message: I18n.t('api.user_not_found') }, status: 404 if user.blank?

    insurance = user.insurance.find(params[:insurance_id])

    render json: { message: I18n.t('api.insurance_not_found') }, status: 404 if insurance.blank?

    response = {}
    response[:insurance_id] = params[:insurance_id]
    response[:coverages] = []
    i = 0
    params[:coberturas].each do |cobertura|
      roof = insurance.roofs.find(cobertura[:roof_id])
      next if roof.nil?

      response[:coverages][i][:name] = roof.name
      response[:coverages][i][:coverages_id] = roof.id
      response[:coverages][i][:capital] = cobertura[:capital]
      response[:coverages][i][:premio] = cobertura[:acapital] * roof.factor
      i += 1
    end
    render json: response
  end
end