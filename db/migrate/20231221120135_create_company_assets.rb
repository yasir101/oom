class CreateCompanyAssets < ActiveRecord::Migration[7.1]
  def change
    create_table :company_assets do |t|
      t.string :name
      t.integer :quantity
      t.text :description
      t.timestamps
    end
  end
end
