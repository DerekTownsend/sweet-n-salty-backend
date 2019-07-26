class IngredientsController < ApplicationController
  def index
    ingredients = Ingredient.all
    # IngredientSerializer.new(ingredients).to_serialized_json
    render json: ingredients
  end

  def show
    ingredient = Ingredient.find_by(id: params[:id])
    # IngredientSerializer.new(ingredient).to_serialized_json
    render json: ingredient
  end

end
