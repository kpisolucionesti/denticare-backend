class RemoveColumnsDoctors < ActiveRecord::Migration[7.0]
  def change
    remove_column :doctors, :speciality_id
  end
end
