class MakersController < ApplicationController
  def index
    @makers = Maker.all
  end
end
