class CreateSpendingLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :spending_logs do |t|
      t.string :spending_type
      t.string :action
      t.string :amount
      t.integer :quantity
      t.text :description
      t.timestamps
    end
  end
end
