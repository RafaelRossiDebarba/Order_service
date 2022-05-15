class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.text :description
      t.decimal :price
      t.belongs_to :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
