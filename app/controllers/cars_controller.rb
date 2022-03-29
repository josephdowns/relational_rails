class CarsController < ApplicationController

  def index
    @cars = Car.in_production
  end

  def show
    @car = Car.find(params[:id])
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    car = Car.find(params[:id])
    car.update(car_params)
    redirect_to "/cars/#{car.id}"
  end

  def car_params
    params.permit(:name, :color, :in_production, :doors)
  end
end
