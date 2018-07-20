class PoursController < ApplicationController
  before_action :set_pour, only: [:show, :edit, :update, :destroy]

  # GET /pours
  # GET /pours.json
  def index
    @pours = Pour.all
  end

  # GET /pours/1
  # GET /pours/1.json
  def show
  end

  # GET /pours/new
  def new
    @pour = Pour.new
  end

  # GET /pours/1/edit
  def edit
  end

  # POST /pours
  # POST /pours.json
  def create
    @pour = Pour.new(pour_params)

    respond_to do |format|
      if @pour.save
        format.html { redirect_to @pour, notice: 'Pour was successfully created.' }
        format.json { render :show, status: :created, location: @pour }
      else
        format.html { render :new }
        format.json { render json: @pour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pours/1
  # PATCH/PUT /pours/1.json
  def update
    respond_to do |format|
      if @pour.update(pour_params)
        format.html { redirect_to @pour, notice: 'Pour was successfully updated.' }
        format.json { render :show, status: :ok, location: @pour }
      else
        format.html { render :edit }
        format.json { render json: @pour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pours/1
  # DELETE /pours/1.json
  def destroy
    @pour.destroy
    respond_to do |format|
      format.html { redirect_to pours_url, notice: 'Pour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pour
      @pour = Pour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pour_params
      params.require(:pour).permit(:load_id)
    end
end
