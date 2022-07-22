class CockpitController < ApplicationController
  layout 'dashboard'

  before_action :authenticate_user!

  def admin
    @loans_count = 10
    @investors_count = 10
    @contributions_count = 10
    @loan_payments_count = 10
    @investors = []
    @loaners = []
    @loan_amount = 30000
    @contributions_amount = 4000
    @loan_payment_amount = 84783
  end

  def user
  end
end
