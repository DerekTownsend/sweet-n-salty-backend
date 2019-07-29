class SnacksController < ApplicationController
  def index
    snacks = Snack.all
    render json: SnackSerializer.new(snacks).to_serialized_json
  end

  def show
    snack = Snack.find_by(id: params[:id])
    render json: SnackSerializer.new(snack).to_serialized_json
  end

  def create
    snack =  Snack.new(snack_params)
    ingredients = snack_params[:ingredients_attributes].collect do |ingredient|
      Ingredient.find_by(name: ingredient[:name], type_of_ingredient: ingredient[:type_of_ingredient])
    end
    mixes = []
     ingredients.each_with_index do |ingredient, index|
      mixes << Mix.new(snack: snack, ingredient: ingredient, amount: snack_params[:mixes_attributes][index][:amount])
    end
    render json: {message: "success"}
  end

  private
  def snack_params
    params.require(:snack).permit(:name, :description, :occasion, :user_id, ingredients_attributes: [:name, :type_of_ingredient], mixes_attributes: [:snack_id, :ingredient_id, :amount])
  end

end
