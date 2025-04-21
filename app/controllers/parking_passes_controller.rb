class ParkingPassesController < ApplicationController
  before_action :set_parking_pass, only: %i[ show edit update destroy ]
  before_action :set_guest, only: %i[ new create ]

  # GET /parking_passes or /parking_passes.json
  def index
    @parking_passes = ParkingPass.all
  end

  # GET /parking_passes/1 or /parking_passes/1.json
  def show
  end

  # GET /parking_passes/new
  def new
    @parking_pass = @guest.parking_passes.new
  end

  # GET /parking_passes/1/edit
  def edit
  end

  # POST /parking_passes or /parking_passes.json
  def create
    @parking_pass = @guest.parking_passes.new(parking_pass_params)

      if @parking_pass.save
        qrcode = generate_parking_pass(@parking_pass)
        @parking_pass.update(qr_code: qrcode)
        redirect_to dashboard_path, notice: "Parking pass was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /parking_passes/1 or /parking_passes/1.json
  def update
      if @parking_pass.update(parking_pass_params)
        redirect_to dashboard_path, notice: "Parking pass was successfully updated."
      else
       render :edit, status: :unprocessable_entity
      end
  end

  # DELETE /parking_passes/1 or /parking_passes/1.json
  def destroy
    @parking_pass.destroy!
  redirect_to dashboard_path, status: :see_other, notice: "Parking pass was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking_pass
      @parking_pass = ParkingPass.find(params.expect(:id))
    end

    def set_guest
      @guest = Guest.find(params.expect(:guest_id))
    end

    # Only allow a list of trusted parameters through.
    def parking_pass_params
      params.expect(parking_pass: [ :expiration_date, :valid_days ])
    end

    def generate_parking_pass(parking_pass)
      puts parking_pass
      RQRCode::QRCode.new(guest_parking_pass_url(parking_pass.guest_id, parking_pass.id)).as_svg
    end
end
