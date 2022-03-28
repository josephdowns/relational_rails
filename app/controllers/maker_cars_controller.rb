class MakerCarsController < ApplicationController
  def index
    @maker = Maker.find(params[:maker_id])
    @cars = @maker.cars
  end

  def new
    @maker = Maker.find(params[:maker_id])
  end

  def create
    @maker = Maker.find(params[:maker_id])
    car = @maker.cars.create({
      name: params[:name],
      color: params[:color],
      doors: params[:doors],
      in_production: params[:in_production],
      })

    car.save

    redirect_to "/makers/#{car.maker_id}/cars"
  end

end
