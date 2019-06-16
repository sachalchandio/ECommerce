require "application_system_test_case"

class JoinOnDSdBsTest < ApplicationSystemTestCase
  setup do
    @join_on_d_sd_b = join_on_d_sd_bs(:one)
  end

  test "visiting the index" do
    visit join_on_d_sd_bs_url
    assert_selector "h1", text: "Join On D Sd Bs"
  end

  test "creating a Join on d sd b" do
    visit join_on_d_sd_bs_url
    click_on "New Join On D Sd B"

    click_on "Create Join on d sd b"

    assert_text "Join on d sd b was successfully created"
    click_on "Back"
  end

  test "updating a Join on d sd b" do
    visit join_on_d_sd_bs_url
    click_on "Edit", match: :first

    click_on "Update Join on d sd b"

    assert_text "Join on d sd b was successfully updated"
    click_on "Back"
  end

  test "destroying a Join on d sd b" do
    visit join_on_d_sd_bs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Join on d sd b was successfully destroyed"
  end
end
