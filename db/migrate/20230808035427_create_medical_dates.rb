class CreateMedicalDates < ActiveRecord::Migration[7.0]
  def change
    create_table :medical_dates do |t|
      t.references :patient
      t.date :ingress_date
      t.references :doctor
      t.references :room
      t.timestamps  
    end
  end
end
