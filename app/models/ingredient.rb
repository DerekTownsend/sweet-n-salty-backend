class Ingredient < ApplicationRecord
  has_many :mixes
  has_many :snacks, through: :mixes

end
