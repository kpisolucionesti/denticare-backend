class DropAllTables < ActiveRecord::Migration[7.0]
  def change
    drop_table :patients
    drop_table :doctors
    drop_table :rooms
  end
end
