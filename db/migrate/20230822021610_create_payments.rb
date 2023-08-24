class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.references :patient
      t.string :payment_type
      t.integer :amount
      t.timestamps
    end
  end
end
