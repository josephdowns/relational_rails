class MakersController < ApplicationController
  def index
    @makers = Maker.all
  end

  def show
    @maker = Maker.find(params[:id])
  end
end
