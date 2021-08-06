class GardensController < ApplicationController
  def show
    @garden = Garden.find(params[:id])
    @garden.unique_plants
  end
end
