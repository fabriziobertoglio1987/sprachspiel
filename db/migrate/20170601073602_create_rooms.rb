class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :title
      t.text :description

      t.timestamps
    end

    create_table :buildings do |t|
      t.string :name
      t.integer :price_id
    end
  end
end
