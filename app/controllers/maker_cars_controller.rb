class MakerCarsController < ApplicationController
  def index
    @maker = Maker.find(params[:maker_id])
    @cars = @maker.cars
  end

  def new
  end

  def create
    # @maker = Maker.find(params[:maker_id])
    binding.pry
    car = Car.create({
      name: params[:car][:name],
      color: params[:car][:color],
      doors: params[:car][:doors],
      in_production: params[:car][:in_production],
      maker_id: params[:car][:maker_id]
      })

    car.save

    redirect_to "/makers/:maker_id/cars"
  end

end
