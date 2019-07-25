class CreateSnacks < ActiveRecord::Migration[5.2]
  def change
    create_table :snacks do |t|
      t.string :name
      t.text :description
      t.string :occasion

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
