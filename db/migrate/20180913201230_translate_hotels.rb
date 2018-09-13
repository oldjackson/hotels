class TranslateHotels < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up do
        Hotel.create_translation_table!(
          { :description => :text },
          { :migrate_data => true })
      end

      dir.down do
        Hotel.drop_translation_table! :migrate_data => true
      end
    end
  end
end
