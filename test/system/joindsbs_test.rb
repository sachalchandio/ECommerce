require "application_system_test_case"

class JoindsbsTest < ApplicationSystemTestCase
  setup do
    @joindsb = joindsbs(:one)
  end

  test "visiting the index" do
    visit joindsbs_url
    assert_selector "h1", text: "Joindsbs"
  end

  test "creating a Joindsb" do
    visit joindsbs_url
    click_on "New Joindsb"

    click_on "Create Joindsb"

    assert_text "Joindsb was successfully created"
    click_on "Back"
  end

  test "updating a Joindsb" do
    visit joindsbs_url
    click_on "Edit", match: :first

    click_on "Update Joindsb"

    assert_text "Joindsb was successfully updated"
    click_on "Back"
  end

  test "destroying a Joindsb" do
    visit joindsbs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Joindsb was successfully destroyed"
  end
end
