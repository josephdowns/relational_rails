class MakerCarsController < ApplicationController
  def index
    @maker = Maker.find(params[:id])
    @cars = @maker.cars
  end

end
