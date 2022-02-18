require 'test_helper'

class LoansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loan = loans(:one)
  end

  test "should get index" do
    get loans_url
    assert_response :success
  end

  test "should get new" do
    get new_loan_url
    assert_response :success
  end

  test "should create loan" do
    assert_difference('Loan.count') do
      post loans_url, params: { loan: { date_loan_given: @loan.date_loan_given, date_payment_starts: @loan.date_payment_starts, interest_on_loan_per_month: @loan.interest_on_loan_per_month, loan_period_in_months: @loan.loan_period_in_months, loaner_id: @loan.loaner_id, payment_cadence: @loan.payment_cadence, payment_day: @loan.payment_day, principal: @loan.principal, status: @loan.status } }
    end

    assert_redirected_to loan_url(Loan.last)
  end

  test "should show loan" do
    get loan_url(@loan)
    assert_response :success
  end

  test "should get edit" do
    get edit_loan_url(@loan)
    assert_response :success
  end

  test "should update loan" do
    patch loan_url(@loan), params: { loan: { date_loan_given: @loan.date_loan_given, date_payment_starts: @loan.date_payment_starts, interest_on_loan_per_month: @loan.interest_on_loan_per_month, loan_period_in_months: @loan.loan_period_in_months, loaner_id: @loan.loaner_id, payment_cadence: @loan.payment_cadence, payment_day: @loan.payment_day, principal: @loan.principal, status: @loan.status } }
    assert_redirected_to loan_url(@loan)
  end

  test "should destroy loan" do
    assert_difference('Loan.count', -1) do
      delete loan_url(@loan)
    end

    assert_redirected_to loans_url
  end
end
