class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :country_code
      t.text :description
      t.integer :views_count, default: 0

      t.timestamps null: false
    end
  end
end
