class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.references :patient
      t.string :name
      t.timestamps
    end
  end
end
