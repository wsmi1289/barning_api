module V1
  class IngredientsController < ProtectedController    
    def index
      render json: current_user.ingredients
    end
  end
end