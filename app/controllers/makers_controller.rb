class MakersController < ApplicationController
  def index
    @makers = makers.all
  end
end
