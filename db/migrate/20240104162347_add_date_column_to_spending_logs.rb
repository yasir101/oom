class AddDateColumnToSpendingLogs < ActiveRecord::Migration[7.1]
  def change
    add_column :spending_logs, :spending_date, :datetime
  end
end
