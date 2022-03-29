class MakerCarsController < ApplicationController
  def index
    @maker = Maker.find(params[:maker_id])
    if params[:order] == "alpha"
      @cars = @maker.cars.sort_by_alpha
    else
      @cars = @maker.cars
    end
  end

  def new
    @maker = Maker.find(params[:maker_id])
  end

  def create
    @maker = Maker.find(params[:maker_id])
    car = @maker.cars.create(car_params)
    redirect_to "/makers/#{car.maker_id}/cars"
  end

  def car_params
    params.permit(:name, :color, :doors, :in_production)
  end

end
