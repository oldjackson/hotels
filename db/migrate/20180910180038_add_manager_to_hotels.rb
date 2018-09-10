class AddManagerToHotels < ActiveRecord::Migration
  def change
    add_reference :hotels, :manager, index: true
  end
end
