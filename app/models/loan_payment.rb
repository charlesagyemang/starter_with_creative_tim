class LoanPayment < ApplicationRecord
  belongs_to :loaner
  belongs_to :loan
end
