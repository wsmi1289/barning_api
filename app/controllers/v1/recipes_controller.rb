module V1
  class RecipesController < ProtectedController
    before_action :set_recipe, only: [:update, :destroy]
    
    def index
      render json: current_user.recipes, include: ['recipe_ingredients', 'recipe_ingredients.ingredient']
    end

    def update
      if @recipe.update(recipe_params)
        render json: @recipe
      else
        render json: { errors: @recipe.errors.full_messages }
      end
    end

    def destroy
      @recipe.destroy!
      render json: @recipe
    end

    private

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
  end
end