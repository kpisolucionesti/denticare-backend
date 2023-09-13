class CreateMedicalSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :medical_sessions do |t|
      t.date :check_in
      t.references :patient
      t.references :doctor
      t.references :room
      t.references :treatment
      t.timestamps
    end
  end
end
