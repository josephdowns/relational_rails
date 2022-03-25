class MakerCarsController < ApplicationController
  def index
    @maker = Maker.find(params[:maker_id])
    @cars = @maker.cars
  end

end
