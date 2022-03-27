class MakersController < ApplicationController
  def index
    @makers = Maker.order_by_created_at
  end

  def show
    @maker = Maker.find(params[:id])
    @count = @maker.cars_count
  end

  def new
  end

  def create
    maker = Maker.new({
      name: params[:maker][:name],
      domestic: params[:maker][:domestic],
      year_founded: params[:maker][:year_founded]
      })

    maker.save

    redirect_to '/makers'
  end
end
