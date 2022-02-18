require "application_system_test_case"

class LoanPaymentsTest < ApplicationSystemTestCase
  setup do
    @loan_payment = loan_payments(:one)
  end

  test "visiting the index" do
    visit loan_payments_url
    assert_selector "h1", text: "Loan Payments"
  end

  test "creating a Loan payment" do
    visit loan_payments_url
    click_on "New Loan Payment"

    fill_in "Amount", with: @loan_payment.amount
    fill_in "Loan", with: @loan_payment.loan_id
    fill_in "Loaner", with: @loan_payment.loaner_id
    fill_in "Mode", with: @loan_payment.mode
    fill_in "Next payment date", with: @loan_payment.next_payment_date
    fill_in "Status", with: @loan_payment.status
    click_on "Create Loan payment"

    assert_text "Loan payment was successfully created"
    click_on "Back"
  end

  test "updating a Loan payment" do
    visit loan_payments_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @loan_payment.amount
    fill_in "Loan", with: @loan_payment.loan_id
    fill_in "Loaner", with: @loan_payment.loaner_id
    fill_in "Mode", with: @loan_payment.mode
    fill_in "Next payment date", with: @loan_payment.next_payment_date
    fill_in "Status", with: @loan_payment.status
    click_on "Update Loan payment"

    assert_text "Loan payment was successfully updated"
    click_on "Back"
  end

  test "destroying a Loan payment" do
    visit loan_payments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Loan payment was successfully destroyed"
  end
end
