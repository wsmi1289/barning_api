module V1
  module Users
    class RegistrationsController < ProtectedController
      skip_before_action :require_authentication, only: [:create]
      def create
        user = User.new(user_params)
        if user.save
          response.set_cookie(
            'jwt',
            value: JwtToken.encode(user),
            httponly: true,
            secure: Rails.env.production?
          )

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