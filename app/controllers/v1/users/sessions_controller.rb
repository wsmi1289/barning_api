module V1
  module Users
    class SessionsController < ProtectedController
      skip_before_action :require_authentication, only: [:create]
      protect_from_forgery except: [:create]

      def current
        decoded = JwtToken.decode(cookies.signed[:jwt])
      end

      def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          session[:jwt] = JwtToken.encode(user)
          render json: user, status: :created
        else
          render status: :unauthorized
        end
      end

      def destroy
        render plain: 'wooo'
      end
    end
  end
end