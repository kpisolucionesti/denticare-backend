class CreateMedicalSession < ActiveRecord::Migration[7.0]
  def change
    create_table :medical_sessions do |t|
      t.date :ingress_date
      t.references :patient_id
      t.references :doctor_id
      t.references :room_id
      t.references :treatment_id
      t.timestamps
    end
  end
end
