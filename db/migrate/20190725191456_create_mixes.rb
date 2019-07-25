class CreateMixes < ActiveRecord::Migration[5.2]
  def change
    create_table :mixes do |t|
      t.references :snack, foreign_key: true
      t.references :ingredient, foreign_key: true

      t.timestamps
    end
  end
end
