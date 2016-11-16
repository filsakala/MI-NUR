class KnizkasController < ApplicationController
  before_action :set_knizka, only: [:show, :edit, :update, :destroy]

  # GET /knizkas
  # GET /knizkas.json
  def index
    @knizkas = Knizka.all
  end

  # GET /knizkas/1
  # GET /knizkas/1.json
  def show
  end

  # GET /knizkas/new
  def new
    @knizka = Knizka.new
  end

  # GET /knizkas/1/edit
  def edit
  end

  # POST /knizkas
  # POST /knizkas.json
  def create
    @knizka = Knizka.new(knizka_params)

    respond_to do |format|
      if @knizka.save
        format.html { redirect_to @knizka, notice: 'Knizka was successfully created.' }
        format.json { render :show, status: :created, location: @knizka }
      else
        format.html { render :new }
        format.json { render json: @knizka.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /knizkas/1
  # PATCH/PUT /knizkas/1.json
  def update
    respond_to do |format|
      if @knizka.update(knizka_params)
        format.html { redirect_to @knizka, notice: 'Knizka was successfully updated.' }
        format.json { render :show, status: :ok, location: @knizka }
      else
        format.html { render :edit }
        format.json { render json: @knizka.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /knizkas/1
  # DELETE /knizkas/1.json
  def destroy
    @knizka.destroy
    respond_to do |format|
      format.html { redirect_to knizkas_url, notice: 'Knizka was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_knizka
      @knizka = Knizka.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def knizka_params
      params.fetch(:knizka, {})
    end
end
