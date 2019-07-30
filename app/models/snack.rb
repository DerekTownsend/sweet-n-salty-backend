class Snack < ApplicationRecord
  belongs_to :user
  has_many :mixes, :dependent => :destroy
  has_many :ingredients, through: :mixes
  accepts_nested_attributes_for :mixes, :ingredients
end
