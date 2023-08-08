class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.integer :ci
      t.string :name
      t.references :speciality
      t.timestamps
    end
  end
end
