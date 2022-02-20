class LoanPayment < ApplicationRecord
  belongs_to :loaner
  belongs_to :loan

  before_create :set_next_payment_date

  def set_next_payment_date
    next_week_date = Date.today.next_occurring(self.loan.payment_day.downcase.to_sym)
    cadence = {
      'WEEKLY' => -> { next_week_date },
      'BI_WEEKLY' => -> { next_week_date + 1.week},
      'MONTHLY' => -> { next_week_date + 3.week}
    }
    self.next_payment_date = cadence[self.loan.payment_cadence].call
  end
end
