class KomentarsController < ApplicationController
  before_action :set_komentar, only: [:show, :edit, :update, :destroy]

  # GET /komentars
  # GET /komentars.json
  def index
    @komentars = Komentar.all
  end

  # GET /komentars/1
  # GET /komentars/1.json
  def show
  end

  # GET /komentars/new
  def new
    @komentar = Komentar.new
  end

  # GET /komentars/1/edit
  def edit
  end

  # POST /komentars
  # POST /komentars.json
  def create
    @komentar = Komentar.new(komentar_params)
    @komentar.autor = "Gege"

    respond_to do |format|
      if @komentar.save
        format.html { redirect_to :back, notice: 'koment_add' }
        format.json { render :show, status: :created, location: @komentar }
      else
        format.html { render :new }
        format.json { render json: @komentar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /komentars/1
  # PATCH/PUT /komentars/1.json
  def update
    respond_to do |format|
      if @komentar.update(komentar_params)
        format.html { redirect_to @komentar, notice: 'Komentar was successfully updated.' }
        format.json { render :show, status: :ok, location: @komentar }
      else
        format.html { render :edit }
        format.json { render json: @komentar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /komentars/1
  # DELETE /komentars/1.json
  def destroy
    @komentar.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'koment_delete' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_komentar
      @komentar = Komentar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def komentar_params
      params.require(:komentar).permit(:autor, :text, :priklad_id)
    end
end
