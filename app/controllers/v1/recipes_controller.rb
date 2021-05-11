module V1
  class RecipesController < ProtectedController

    def index
      render json: current_user.recipes, include: ['recipe_ingredients', 'recipe_ingredients.ingredient']
    end

    private

    def user_params
      params.require(:user).permit(:email, :password)
    end
  end
end