class AddColumnTreatment < ActiveRecord::Migration[7.0]
  def change
    add_column :treatments, :amount, :integer
  end
end
