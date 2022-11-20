class RoofsController < ApplicationController
  def create
    roof = Roof.new(roof_params)
    roof.insurance = Insurance.find(params[:insurance_id])
    if roof.save
      render json: { message: I18n.t('api.roof_created') }, status: 200
    else
      render json: { message: roof.errors.full_messages }, status: 422
    end
  end

  def get_roofs
    insurance = Insurance.find(params[:insurance_id])
    if insurance.blank? || insurance.user != current_user
      render json: { message: I18n.t('api.insurance_not_found') }, status: 404
    else
      render json: insurance.roofs
    end
  end

  private

  def roof_params
    params.permit(:name, :factor)
  end
end
