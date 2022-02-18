class CreateLoanPayments < ActiveRecord::Migration[6.0]
  def change
    create_table :loan_payments do |t|
      t.references :loaner, null: false, foreign_key: true
      t.references :loan, null: false, foreign_key: true
      t.string :mode
      t.string :amount
      t.string :status
      t.string :next_payment_date

      t.timestamps
    end
  end
end
