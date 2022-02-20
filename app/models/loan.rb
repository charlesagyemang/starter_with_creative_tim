class Loan < ApplicationRecord
  belongs_to :loaner

  before_create :set_amount

  def set_amount
    self.amount = self.interest_on_loan_per_month > 0.00 ? (((self.principal * self.interest_on_loan_per_month) / 100) *  self.principal) + self.loan_period_in_months : self.principal
  end
end

#master