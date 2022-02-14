class CreateContributions < ActiveRecord::Migration[6.0]
  def change
    create_table :contributions do |t|
      t.references :investors
      t.decimal :principal
      t.date :period_start
      t.date :period_end
      t.decimal :interest
      t.decimal :amount

      t.timestamps
    end
  end
end
