class AddUserManagerForeignKey < ActiveRecord::Migration
  def change
    add_foreign_key :hotels, :users, column: :manager_id
  end
end
