require "application_system_test_case"

class DebtsTest < ApplicationSystemTestCase
  setup do
    @debt = debts(:one)
  end

  test "visiting the index" do
    visit debts_url
    assert_selector "h1", text: "Debts"
  end

  test "creating a Debt" do
    visit debts_url
    click_on "New Debt"

    fill_in "Amortization Period", with: @debt.amortization_period
    fill_in "Code", with: @debt.code
    fill_in "Contract Value Cents", with: @debt.contract_value_cents
    fill_in "Creditor", with: @debt.creditor_id
    fill_in "Grace Period", with: @debt.grace_period
    fill_in "Purpose", with: @debt.purpose
    fill_in "Signature Date", with: @debt.signature_date
    click_on "Create Debt"

    assert_text "Debt was successfully created"
    click_on "Back"
  end

  test "updating a Debt" do
    visit debts_url
    click_on "Edit", match: :first

    fill_in "Amortization Period", with: @debt.amortization_period
    fill_in "Code", with: @debt.code
    fill_in "Contract Value Cents", with: @debt.contract_value_cents
    fill_in "Creditor", with: @debt.creditor_id
    fill_in "Grace Period", with: @debt.grace_period
    fill_in "Purpose", with: @debt.purpose
    fill_in "Signature Date", with: @debt.signature_date
    click_on "Update Debt"

    assert_text "Debt was successfully updated"
    click_on "Back"
  end

  test "destroying a Debt" do
    visit debts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Debt was successfully destroyed"
  end
end
