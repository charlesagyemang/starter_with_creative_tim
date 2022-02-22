class RemoveAmountFromFromLoanPayments < ActiveRecord::Migration[6.0]
  def change
    remove_column :loan_payments, :amount, :string
  end
end
