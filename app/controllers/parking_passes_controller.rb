class ParkingPassesController < ApplicationController
  before_action :set_parking_pass, only: %i[ show edit update destroy ]

  # GET /parking_passes or /parking_passes.json
  def index
    @parking_passes = ParkingPass.all
  end

  # GET /parking_passes/1 or /parking_passes/1.json
  def show
  end

  # GET /parking_passes/new
  def new
    @parking_pass = ParkingPass.new
  end

  # GET /parking_passes/1/edit
  def edit
  end

  # POST /parking_passes or /parking_passes.json
  def create
    @parking_pass = ParkingPass.new(parking_pass_params)

    respond_to do |format|
      if @parking_pass.save
        format.html { redirect_to @parking_pass, notice: "Parking pass was successfully created." }
        format.json { render :show, status: :created, location: @parking_pass }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @parking_pass.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parking_passes/1 or /parking_passes/1.json
  def update
    respond_to do |format|
      if @parking_pass.update(parking_pass_params)
        format.html { redirect_to @parking_pass, notice: "Parking pass was successfully updated." }
        format.json { render :show, status: :ok, location: @parking_pass }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parking_pass.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parking_passes/1 or /parking_passes/1.json
  def destroy
    @parking_pass.destroy!

    respond_to do |format|
      format.html { redirect_to parking_passes_path, status: :see_other, notice: "Parking pass was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking_pass
      @parking_pass = ParkingPass.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def parking_pass_params
      params.expect(parking_pass: [ :expiration_date, :qr_code, :valid_days, :guest_id ])
    end
end
