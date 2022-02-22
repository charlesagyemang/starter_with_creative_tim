class LoanPayment < ApplicationRecord
  belongs_to :loaner
  belongs_to :loan
  validate :amount_is_less_more_than_owing
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

  private 
    def amount_is_less_more_than_owing
      paid_alredy = LoanPayment.where(loan_id: self.loan_id).sum(:amount)
      puts "======= EIIII HE HAS PAID ALREDY: #{paid_alredy} ======="
      sum_of_amount = paid_alredy + self.amount.to_i
      puts "======= EIIII HE HAS SUM OF AMOUNT : #{sum_of_amount} ======="
      if sum_of_amount  > self.loan.amount
        errors.add(:amount, "Amount Being Paif Now Will Exceed Current Owing Amount")
      end
    end
end
