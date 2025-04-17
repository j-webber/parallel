require "test_helper"

class ParkingPassesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @parking_pass = parking_passes(:one)
  end

  test "should get index" do
    get parking_passes_url
    assert_response :success
  end

  test "should get new" do
    get new_parking_pass_url
    assert_response :success
  end

  test "should create parking_pass" do
    assert_difference("ParkingPass.count") do
      post parking_passes_url, params: { parking_pass: { expiration_date: @parking_pass.expiration_date, guest_id: @parking_pass.guest_id, qr_code: @parking_pass.qr_code, valid_days: @parking_pass.valid_days } }
    end

    assert_redirected_to parking_pass_url(ParkingPass.last)
  end

  test "should show parking_pass" do
    get parking_pass_url(@parking_pass)
    assert_response :success
  end

  test "should get edit" do
    get edit_parking_pass_url(@parking_pass)
    assert_response :success
  end

  test "should update parking_pass" do
    patch parking_pass_url(@parking_pass), params: { parking_pass: { expiration_date: @parking_pass.expiration_date, guest_id: @parking_pass.guest_id, qr_code: @parking_pass.qr_code, valid_days: @parking_pass.valid_days } }
    assert_redirected_to parking_pass_url(@parking_pass)
  end

  test "should destroy parking_pass" do
    assert_difference("ParkingPass.count", -1) do
      delete parking_pass_url(@parking_pass)
    end

    assert_redirected_to parking_passes_url
  end
end
