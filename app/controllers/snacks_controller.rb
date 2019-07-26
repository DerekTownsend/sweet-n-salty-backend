class SnacksController < ApplicationController
  def index
    snacks = Snack.all
    # SnackSerializer.new(snacks).to_serialized_json
    render json: snacks
  end

  def show
    snack = Snack.find_by(id: params[:id])
    # SnackSerializer.new(snack).to_serialized_json
    render json: snack
  end
end
