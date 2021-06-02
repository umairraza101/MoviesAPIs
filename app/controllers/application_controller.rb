class ApplicationController < ActionController::API
    include DeviseTokenAuth::Concerns::SetUserByToken
    rescue_from ActiveRecord::RecordNotFound, with: :render_404

    def validate_admin
      render json: { message: "Not Authorized" }, status: 401 unless current_user.admin?
    end

  private
    def render_404
      render json: { error: "404 Not Found" }, status: 404
    end
end
