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
    maker = Maker.create(maker_params)
    redirect_to '/makers'
  end

  def edit
    @maker = Maker.find(params[:id])
  end

  def update
    maker = Maker.find(params[:id])
    maker.update(maker_params)
    redirect_to "/makers/#{maker.id}"
  end

  def destroy
    maker = Maker.find(params[:id])
    maker.destroy
    redirect_to "/makers"
  end

  def maker_params
    params.permit(:name, :year_founded, :domestic)
  end
end
