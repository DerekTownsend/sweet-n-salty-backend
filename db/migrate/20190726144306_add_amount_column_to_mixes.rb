class AddAmountColumnToMixes < ActiveRecord::Migration[5.2]
  def change
    add_column :mixes, :amount, :string
  end
end
