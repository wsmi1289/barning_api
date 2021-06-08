class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  enum scale: {
    tsp: 0,
    tbsp: 1,
    C: 2,
    oz: 3,
    g: 4,
    pn: 5,
    gal: 6,
    lb: 7,
    L: 8,
    mL: 9,
    kg: 10,
    pt: 11,
    qt: 12,
    ds: 13
  }
end
