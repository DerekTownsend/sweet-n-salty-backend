class Snack < ApplicationRecord
  belongs_to :user
  has_many :mixes
  has_many :ingredients, through: :mixes
  accepts_nested_attributes_for :mixes, :ingredients
end
