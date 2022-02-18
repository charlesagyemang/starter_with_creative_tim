class CreateLoans < ActiveRecord::Migration[6.0]
  def change
    create_table :loans do |t|
      t.decimal :principal
      t.date :date_payment_starts
      t.date :date_loan_given
      t.decimal :interest_on_loan_per_month
      t.integer :loan_period_in_months
      t.string :payment_cadence
      t.string :payment_day
      t.references :loaner, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
