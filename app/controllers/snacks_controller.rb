class SnacksController < ApplicationController
  skip_before_action :authorized, only: [:index, :show]

  def index
    snacks = Snack.all
    render json: SnackSerializer.new(snacks).to_serialized_json
  end

  def show
    snack = Snack.find_by(id: params[:id])
    render json: SnackSerializer.new(snack).to_serialized_json
  end

  def create
    snack =  Snack.create(name: snack_params[:name], description: snack_params[:description], occasion: snack_params[:occasion], user: current_user)

    ingredients = snack_params[:ingredients_attributes].collect do |ingredient|
      temp = Ingredient.find_by(name: ingredient[:name], type_of_ingredient: ingredient[:type_of_ingredient])
      if !temp
        temp = Ingredient.create(name: ingredient[:name], type_of_ingredient: ingredient[:type_of_ingredient])
      end
      temp
    end

    ingredients.each_with_index do |ingredient, index|
       Mix.create(snack: snack, ingredient: ingredient, amount: snack_params[:mixes_attributes][index][:amount])
    end

    render json: SnackSerializer.new(snack).to_serialized_json
  end

  def update
    snack =  Snack.find_by(id: params[:id])
    snack.update_attributes(name: snack_params[:name], description: snack_params[:description], occasion: snack_params[:occasion])

    snack.mixes.destroy_all

    ingredients = snack_params[:ingredients_attributes].collect do |ingredient|
      temp = Ingredient.find_by(name: ingredient[:name], type_of_ingredient: ingredient[:type_of_ingredient])
      if !temp
        temp = Ingredient.create(name: ingredient[:name], type_of_ingredient: ingredient[:type_of_ingredient])
      end
      temp
    end

    ingredients.each_with_index do |ingredient, index|
      p "SNACK #{snack}"
      p "ingredient #{ingredient}"
       temp = Mix.find_by(snack: snack, ingredient: ingredient, amount: snack_params[:mixes_attributes][index][:amount])
       p "TEMP #{temp}"
       if !temp
         temp = Mix.create(snack: snack, ingredient: ingredient, amount: snack_params[:mixes_attributes][index][:amount])
       end
       temp
    end

    render json: SnackSerializer.new(snack).to_serialized_json
  end

  def destroy

    Snack.find_by(id: params[:id]).destroy
    render json: {misson: "successful"}
  end

  private
  def snack_params
    params.require(:snack).permit(:name, :description, :occasion, :user_id, ingredients_attributes: [:name, :type_of_ingredient], mixes_attributes: [:snack_id, :ingredient_id, :amount])
  end

end
