class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :color
      t.integer :doors
      t.boolean :in_production
      t.timestamps 
    end
  end
end
