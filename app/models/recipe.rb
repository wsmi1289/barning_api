class Recipe < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  accepts_nested_attributes_for :recipe_ingredients, allow_destroy: true
end
