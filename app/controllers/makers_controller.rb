class MakersController < ApplicationController
  def index
    @makers = Maker.order_by_created_at
  end

  def show
    @maker = Maker.find(params[:id])
    @count = @maker.cars_count
  end
end
