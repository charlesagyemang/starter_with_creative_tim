class Loan < ApplicationRecord
  belongs_to :loaner
  has_many :loan_payments, dependent: :destroy
  before_create :set_amount

  def set_amount
    self.amount = self.interest_on_loan_per_month > 0.00 ? (((self.loan_period_in_months * self.interest_on_loan_per_month) / 100) *  self.principal) + self.principal : self.principal
  end

  def details
    "#{self.payment_cadence} Payments @ #{self.interest_on_loan_per_month}% per month for #{self.loan_period_in_months} months"
  end
  
end