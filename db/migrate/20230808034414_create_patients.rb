class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.integer :ci
      t.string :name
      t.date :birth_date
      t.string :gender
      t.timestamps
    end
  end
end
