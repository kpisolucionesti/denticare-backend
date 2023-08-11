class RemoveColumnsUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :role_id_id
    remove_column :users, :job_id_id
  end
end
