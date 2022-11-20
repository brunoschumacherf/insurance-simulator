class LoginController < ApiController

  def signup
    user = User.new(user_params)
    if user.save

      render json: { message: I18n.t('api.user_created') }, status: 200
    else
      render json: { message: user.errors.full_messages }, status: 422
    end
  end

  def signin
    user = User.find_by_email(params[:email])

    if user.valid_password?(params[:password])
      sign_in user, current_user
      render json: { message: I18n.t('api.user_logged_in') }, status: 200
    else
      render json: { message: I18n.t('api.invalid_login') }, status: 401
    end
  end

  def signout
    sign_out(current_user)
    render json: { message: I18n.t('api.sign_out.success') }
  end

  def user_map
    render json: current_user.user_map
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation, :name, :age, :address, :number, :zipcode)
  end
end