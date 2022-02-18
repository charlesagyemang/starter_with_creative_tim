class CockpitController < ApplicationController
  layout 'dashboard'

  def admin
    @loans_count = Loan.count
    @investors_count = Investor.count
    @contributions_count = Contribution.count
    @loan_payments_count = LoanPayment.count
    @investors = Investor.last(10)
    @loaners = Loaner.last(10)
  end

  def user
  end
end
