class MakersController < ApplicationController
  def index
    @makers = maker.all
  end
end
