require "application_system_test_case"

class ParkingPassesTest < ApplicationSystemTestCase
  setup do
    @parking_pass = parking_passes(:one)
  end

  test "visiting the index" do
    visit parking_passes_url
    assert_selector "h1", text: "Parking passes"
  end

  test "should create parking pass" do
    visit parking_passes_url
    click_on "New parking pass"

    fill_in "Expiration date", with: @parking_pass.expiration_date
    fill_in "Guest", with: @parking_pass.guest_id
    fill_in "Qr code", with: @parking_pass.qr_code
    fill_in "Valid days", with: @parking_pass.valid_days
    click_on "Create Parking pass"

    assert_text "Parking pass was successfully created"
    click_on "Back"
  end

  test "should update Parking pass" do
    visit parking_pass_url(@parking_pass)
    click_on "Edit this parking pass", match: :first

    fill_in "Expiration date", with: @parking_pass.expiration_date
    fill_in "Guest", with: @parking_pass.guest_id
    fill_in "Qr code", with: @parking_pass.qr_code
    fill_in "Valid days", with: @parking_pass.valid_days
    click_on "Update Parking pass"

    assert_text "Parking pass was successfully updated"
    click_on "Back"
  end

  test "should destroy Parking pass" do
    visit parking_pass_url(@parking_pass)
    accept_confirm { click_on "Destroy this parking pass", match: :first }

    assert_text "Parking pass was successfully destroyed"
  end
end
