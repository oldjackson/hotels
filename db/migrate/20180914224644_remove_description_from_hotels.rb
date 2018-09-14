class RemoveDescriptionFromHotels < ActiveRecord::Migration
  def change
    remove_column :hotels, :description, :text
  end
end
