module V1
  module Users
    class SessionsController < ProtectedController
      include ActionController::HttpAuthentication::Basic::ControllerMethods

      skip_before_action :require_authorization, only: [:create]
      def create
        authenticate_with_http_basic do |email, password|
          user = User.find_by email: email

          if user&.authenticate(password)

            render json: JwtToken.encode(user), status: :created and return
          end
        end
        render status: :unauthorized
      end

      def destroy
        render plain: 'wooo'
      end
    end
  end
end