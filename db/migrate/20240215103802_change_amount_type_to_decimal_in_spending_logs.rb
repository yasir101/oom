class ChangeAmountTypeToDecimalInSpendingLogs < ActiveRecord::Migration[7.1]
  def up
    change_column :spending_logs, :amount, :decimal, precision: 12, scale: 2
  end

  def down
    change_column :spending_logs, :amount, :string
  end
end