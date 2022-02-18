require "application_system_test_case"

class LoanersTest < ApplicationSystemTestCase
  setup do
    @loaner = loaners(:one)
  end

  test "visiting the index" do
    visit loaners_url
    assert_selector "h1", text: "Loaners"
  end

  test "creating a Loaner" do
    visit loaners_url
    click_on "New Loaner"

    fill_in "Address", with: @loaner.address
    fill_in "Email", with: @loaner.email
    fill_in "First name", with: @loaner.first_name
    fill_in "Id number", with: @loaner.id_number
    fill_in "Id type", with: @loaner.id_type
    check "Is verified" if @loaner.is_verified
    fill_in "Last name", with: @loaner.last_name
    fill_in "Occupation", with: @loaner.occupation
    fill_in "Phone number", with: @loaner.phone_number
    fill_in "Status", with: @loaner.status
    click_on "Create Loaner"

    assert_text "Loaner was successfully created"
    click_on "Back"
  end

  test "updating a Loaner" do
    visit loaners_url
    click_on "Edit", match: :first

    fill_in "Address", with: @loaner.address
    fill_in "Email", with: @loaner.email
    fill_in "First name", with: @loaner.first_name
    fill_in "Id number", with: @loaner.id_number
    fill_in "Id type", with: @loaner.id_type
    check "Is verified" if @loaner.is_verified
    fill_in "Last name", with: @loaner.last_name
    fill_in "Occupation", with: @loaner.occupation
    fill_in "Phone number", with: @loaner.phone_number
    fill_in "Status", with: @loaner.status
    click_on "Update Loaner"

    assert_text "Loaner was successfully updated"
    click_on "Back"
  end

  test "destroying a Loaner" do
    visit loaners_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Loaner was successfully destroyed"
  end
end
