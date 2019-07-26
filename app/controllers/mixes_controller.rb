class MixesController < ApplicationController
  def index
    mixes = Mix.all
    # MixSerializer.new(mixes).to_serialized_json
    render json: mixes
  end

  def show
    mix = Mix.find_by(id: params[:id])
    # MixSerializer.new(mix).to_serialized_json
    render json: mix
  end
end
