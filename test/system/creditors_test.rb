require "application_system_test_case"

class CreditorsTest < ApplicationSystemTestCase
  setup do
    @creditor = creditors(:one)
  end

  test "visiting the index" do
    visit creditors_url
    assert_selector "h1", text: "Creditors"
  end

  test "creating a Creditor" do
    visit creditors_url
    click_on "New Creditor"

    fill_in "Name", with: @creditor.name
    click_on "Create Creditor"

    assert_text "Creditor was successfully created"
    click_on "Back"
  end

  test "updating a Creditor" do
    visit creditors_url
    click_on "Edit", match: :first

    fill_in "Name", with: @creditor.name
    click_on "Update Creditor"

    assert_text "Creditor was successfully updated"
    click_on "Back"
  end

  test "destroying a Creditor" do
    visit creditors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Creditor was successfully destroyed"
  end
end
