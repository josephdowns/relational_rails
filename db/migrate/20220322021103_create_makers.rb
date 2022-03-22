class CreateMakers < ActiveRecord::Migration[5.2]
  def change
    create_table :makers do |t|
      t.string :name
      t.boolean :domestic
      t.integer :year_founded
      t.timestamps
    end
  end
end
