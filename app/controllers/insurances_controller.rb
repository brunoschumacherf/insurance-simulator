class InsurancesController < ApiController
  def create
    insurance = Insurance.new
    insurance.user = current_user
    insurance.name = params[:name]

    if insurance.save
      render json: { message: I18n.t('api.insurance_created') }, status: 200
    else
      render json: { message: insurance.errors.full_messages }, status: 400
    end
  end

  def get_insurance
    insurance = Insurance.find(params[:id])
    if insurance.blank? || insurance.user != current_user
      render json: { message: I18n.t('api.insurance_not_found') }, status: 400
    else
      render json: insurance
    end
  end

  def get_insurances
    insurances = current_user.insurances
    render json: insurances
  end

end
