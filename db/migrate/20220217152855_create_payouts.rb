class CreatePayouts < ActiveRecord::Migration[6.0]
  def change
    create_table :payouts do |t|
      t.references :investor, null: false, foreign_key: true
      t.references :contribution, null: false, foreign_key: true
      t.decimal :amount
      t.date :date
      t.text :notes

      t.timestamps
    end
  end
end
