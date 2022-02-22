class AddAmountToLoanPayments < ActiveRecord::Migration[6.0]
  def change
    add_column :loan_payments, :amount, :integer
  end
end
