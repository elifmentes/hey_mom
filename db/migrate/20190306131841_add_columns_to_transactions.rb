class AddColumnsToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :category, :string
    add_column :transactions, :description, :string
    add_column :transactions, :expense, :boolean, default: true
  end
end
