class Maker < ApplicationRecord
  def country
    if domestic == true
      return "Go USA!"
    else
      return "Well...that's cool too."
    end
  end
end
