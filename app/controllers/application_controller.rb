class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def current_user 
    User.first
  end

  def record_not_found
    render json: "Record not found", status: :not_found
  end
end
