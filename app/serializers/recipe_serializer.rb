class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :directions

  has_many :recipe_ingredients

  class RecipeIngredientSerializer < ActiveModel::Serializer
    attributes :id, :amount, :scale

    has_one :ingredient

    class IngredientSerializer  < ActiveModel::Serializer
      attributes :id, :name, :description, :status
    end
  end
end
