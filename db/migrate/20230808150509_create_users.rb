class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :ci
      t.string :name
      t.references :job_id
      t.references :role_id
      t.timestamps
    end
  end
end
