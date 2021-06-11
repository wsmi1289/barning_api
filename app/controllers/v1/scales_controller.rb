module V1
  class ScalesController < ProtectedController    

    def index
      render json: RecipeIngredient.scales.map { |s| { id: s[1], value: s[0] } } 
    end
  end
end