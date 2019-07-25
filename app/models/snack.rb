class Snack < ApplicationRecord
  belongs_to :user
  has_many :mixes
  has_many :ingredients, through: :mixes
end
