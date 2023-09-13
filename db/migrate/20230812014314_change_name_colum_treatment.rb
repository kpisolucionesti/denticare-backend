class ChangeNameColumTreatment < ActiveRecord::Migration[7.0]
  def change
    rename_column :treatments, :treatment, :name
  end
end
