class AddColumMedicalsession < ActiveRecord::Migration[7.0]
  def change
    add_column :medical_sessions, :status, :string
  end
end
