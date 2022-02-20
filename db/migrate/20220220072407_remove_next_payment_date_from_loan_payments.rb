class RemoveNextPaymentDateFromLoanPayments < ActiveRecord::Migration[6.0]
  def change
    remove_column :loan_payments, :next_payment_date, :string
    add_column :loan_payments, :next_payment_date, :date
  end
end
