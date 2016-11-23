class RiesitelsController < ApplicationController
  before_action :set_riesitel, only: [:show, :edit, :update, :destroy]

  # GET /riesitels
  # GET /riesitels.json
  def index
    @riesitels = Riesitel.all
  end

  # GET /riesitels/1
  # GET /riesitels/1.json
  def show
  end

  # GET /riesitels/new
  def new
    @riesitel = Riesitel.new
  end

  # GET /riesitels/1/edit
  def edit
  end

  # POST /riesitels
  # POST /riesitels.json
  def create
    @riesitel = Riesitel.new(riesitel_params)

    respond_to do |format|
      if @riesitel.save
        format.html { redirect_to @riesitel, notice: 'Riesitel was successfully created.' }
        format.json { render :show, status: :created, location: @riesitel }
      else
        format.html { render :new }
        format.json { render json: @riesitel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /riesitels/1
  # PATCH/PUT /riesitels/1.json
  def update
    respond_to do |format|
      if @riesitel.update(riesitel_params)
        format.html { redirect_to @riesitel, notice: 'Riesitel was successfully updated.' }
        format.json { render :show, status: :ok, location: @riesitel }
      else
        format.html { render :edit }
        format.json { render json: @riesitel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /riesitels/1
  # DELETE /riesitels/1.json
  def destroy
    @riesitel.destroy
    respond_to do |format|
      format.html { redirect_to riesitels_url, notice: 'Riesitel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_riesitel
      @riesitel = Riesitel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def riesitel_params
      params.require(:riesitel).permit(:meno, :priezvisko, :adresa, :datum_narodenia, :telefon, :telefon_rodic, :email)
    end
end
