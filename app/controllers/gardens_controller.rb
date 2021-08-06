class GardensController < ApplicationController
  def show
    @garden = Garden.find(params[:id])
    @garden.low_harvest_plants
  end
end
