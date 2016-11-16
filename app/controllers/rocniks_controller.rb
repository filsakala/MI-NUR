class RocniksController < ApplicationController
  before_action :set_rocnik, only: [:show, :edit, :update, :destroy]

  # GET /rocniks
  # GET /rocniks.json
  def index
    @rocniks = Rocnik.all
  end

  # GET /rocniks/1
  # GET /rocniks/1.json
  def show
    @kola_z = Kolo.where(rocnik: @rocnik.cislo, seria: 'Zimná').order(:cislo)
    @kola_l = Kolo.where(rocnik: @rocnik.cislo, seria: 'Letná').order(:cislo)
  end

  # GET /rocniks/new
  def new
    max = Rocnik.order('cislo DESC').first
    redirect_to Rocnik.create(cislo: max.cislo + 1)
  end

  # GET /rocniks/1/edit
  def edit
  end

  # POST /rocniks
  # POST /rocniks.json
  def create
    @rocnik = Rocnik.new(rocnik_params)

    respond_to do |format|
      if @rocnik.save
        format.html { redirect_to @rocnik, notice: 'Rocnik was successfully created.' }
        format.json { render :show, status: :created, location: @rocnik }
      else
        format.html { render :new }
        format.json { render json: @rocnik.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rocniks/1
  # PATCH/PUT /rocniks/1.json
  def update
    respond_to do |format|
      if @rocnik.update(rocnik_params)
        format.html { redirect_to @rocnik, notice: 'Rocnik was successfully updated.' }
        format.json { render :show, status: :ok, location: @rocnik }
      else
        format.html { render :edit }
        format.json { render json: @rocnik.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rocniks/1
  # DELETE /rocniks/1.json
  def destroy
    @rocnik.destroy
    respond_to do |format|
      format.html { redirect_to rocniks_url, notice: 'Rocnik was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_rocnik
    @rocnik = Rocnik.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def rocnik_params
    params.require(:rocnik).permit(:cislo)
  end
end
