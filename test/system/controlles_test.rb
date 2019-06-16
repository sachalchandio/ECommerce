require "application_system_test_case"

class ControllesTest < ApplicationSystemTestCase
  setup do
    @controlle = controlles(:one)
  end

  test "visiting the index" do
    visit controlles_url
    assert_selector "h1", text: "Controlles"
  end

  test "creating a Controlle" do
    visit controlles_url
    click_on "New Controlle"

    fill_in "Departments Subdepartments Brands", with: @controlle.departments_subdepartments_brands
    click_on "Create Controlle"

    assert_text "Controlle was successfully created"
    click_on "Back"
  end

  test "updating a Controlle" do
    visit controlles_url
    click_on "Edit", match: :first

    fill_in "Departments Subdepartments Brands", with: @controlle.departments_subdepartments_brands
    click_on "Update Controlle"

    assert_text "Controlle was successfully updated"
    click_on "Back"
  end

  test "destroying a Controlle" do
    visit controlles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Controlle was successfully destroyed"
  end
end
