class DropMedicalDate < ActiveRecord::Migration[7.0]
  def change
    drop_table :medical_dates
  end
end
