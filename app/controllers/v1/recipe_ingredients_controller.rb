module V1
  class RecipeIngredientsController < ProtectedController    
    before_action :set_recipe_ingredient, only: [:destroy]

    def destroy
      @recipe_ingredient.destroy!
      render json: @recipe_ingredient
    end

    private

    def set_recipe_ingredient
      @recipe_ingredient = RecipeIngredient.find(params[:id])
    end
  end
end