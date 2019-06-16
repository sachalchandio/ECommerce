require "application_system_test_case"

class ControllresTest < ApplicationSystemTestCase
  setup do
    @controllre = controllres(:one)
  end

  test "visiting the index" do
    visit controllres_url
    assert_selector "h1", text: "Controllres"
  end

  test "creating a Controllre" do
    visit controllres_url
    click_on "New Controllre"

    fill_in "Joinbsd", with: @controllre.joinbsd
    click_on "Create Controllre"

    assert_text "Controllre was successfully created"
    click_on "Back"
  end

  test "updating a Controllre" do
    visit controllres_url
    click_on "Edit", match: :first

    fill_in "Joinbsd", with: @controllre.joinbsd
    click_on "Update Controllre"

    assert_text "Controllre was successfully updated"
    click_on "Back"
  end

  test "destroying a Controllre" do
    visit controllres_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Controllre was successfully destroyed"
  end
end
