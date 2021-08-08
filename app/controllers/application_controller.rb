class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActionController::ParameterMissing, with: :parameter_missing

  def record_not_found
    render json: { message: "Not found" }, status: :not_found
  end

  def parameter_missing
    render json: { message: "Error" }, status: :bad_request
  end
end
