class CalibrationsController < ApplicationController
  before_action :set_calibration, only: [:show, :edit, :update, :destroy]

  # GET /calibrations
  # GET /calibrations.json
  def index
    @calibrations = Calibration.all
  end

  # GET /calibrations/1
  # GET /calibrations/1.json
  def show
  end

  # GET /calibrations/new
  def new
    @calibration = Calibration.new
  end

  # GET /calibrations/1/edit
  def edit
  end

  # POST /calibrations
  # POST /calibrations.json
  def create
    @calibration = Calibration.new(calibration_params)

    respond_to do |format|
      if @calibration.save
        format.html { redirect_to @calibration, notice: 'Calibration was successfully created.' }
        format.json { render :show, status: :created, location: @calibration }
      else
        format.html { render :new }
        format.json { render json: @calibration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calibrations/1
  # PATCH/PUT /calibrations/1.json
  def update
    respond_to do |format|
      if @calibration.update(calibration_params)
        format.html { redirect_to @calibration, notice: 'Calibration was successfully updated.' }
        format.json { render :show, status: :ok, location: @calibration }
      else
        format.html { render :edit }
        format.json { render json: @calibration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calibrations/1
  # DELETE /calibrations/1.json
  def destroy
    @calibration.destroy
    respond_to do |format|
      format.html { redirect_to calibrations_url, notice: 'Calibration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calibration
      @calibration = Calibration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calibration_params
      params.require(:calibration).permit(:machine_id, :meter_number, :constant)
    end
end
