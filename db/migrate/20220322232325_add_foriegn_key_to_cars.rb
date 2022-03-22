class AddForiegnKeyToCars < ActiveRecord::Migration[5.2]
  def change
    add_reference :cars, :maker, foreign_key: true
  end
end
