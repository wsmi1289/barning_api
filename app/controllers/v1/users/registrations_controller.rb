module V1
  module Users
    class RegistrationsController < ProtectedController
      skip_before_action :require_authorization, only: [:create]
      def create
        user = User.create(user_params)
        render json: user, status: :created
      end

      def destroy
        current_user.destroy
        render json: {}, status: 204
      end

      private

      def user_params
        params.require(:user).permit(:email, :password)
      end
    end
  end
end