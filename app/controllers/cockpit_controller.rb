class CockpitController < ApplicationController
  layout 'dashboard'

  before_action :authenticate_user!

  def admin
    @loans_count = Loan.count
    @investors_count = Investor.count
    @contributions_count = Contribution.count
    @loan_payments_count = LoanPayment.count
    @investors = Investor.last(10)
    @loaners = Loaner.last(10)
    @loan_amount = Loan.sum(:amount)
    @contributions_amount = Contribution.sum(:amount)
    @loan_payment_amount = LoanPayment.sum(:amount)
  end

  def user
  end
end
