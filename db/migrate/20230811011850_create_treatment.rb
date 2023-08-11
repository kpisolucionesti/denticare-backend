class CreateTreatment < ActiveRecord::Migration[7.0]
  def change
    create_table :treatments do |t|
      t.string :treatment
      t.timestamps
    end
  end
end
