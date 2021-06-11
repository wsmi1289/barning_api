module V1
  class RecipesController < ProtectedController
    before_action :set_recipe, only: [:update, :destroy]
    
    def index
      render json: current_user.recipes, include: ['recipe_ingredients', 'recipe_ingredients.ingredient']
    end

    def update
      if @recipe.update(recipe_params)
        render json: @recipe, include: ['recipe_ingredients', 'recipe_ingredients.ingredient']
      else
        render json: { errors: @recipe.errors.full_messages }
      end
    end

    def destroy
      @recipe.destroy!
      render json: @recipe, include: ['recipe_ingredients', 'recipe_ingredients.ingredient']
    end

    private

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.permit(:description, :directions, :name, recipe_ingredients_attributes: [
        :id, :amount, :scale, :recipe_id, :ingredient_id
      ])
    end
  end
end