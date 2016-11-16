class PrikladsController < ApplicationController
  before_action :set_priklad, only: [:show, :edit, :update, :destroy]

  # GET /priklads
  # GET /priklads.json
  def index
    @priklads = Priklad.all
  end

  # GET /priklads/1
  # GET /priklads/1.json
  def show
  end

  # GET /priklads/new
  def new
    @priklad = Priklad.new
  end

  # GET /priklads/1/edit
  def edit
  end

  # POST /priklads
  # POST /priklads.json
  def create
    @priklad = Priklad.new(priklad_params)

    respond_to do |format|
      if @priklad.save
        format.html { redirect_to @priklad, notice: 'Priklad was successfully created.' }
        format.json { render :show, status: :created, location: @priklad }
      else
        format.html { render :new }
        format.json { render json: @priklad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /priklads/1
  # PATCH/PUT /priklads/1.json
  def update
    respond_to do |format|
      if @priklad.update(priklad_params)
        format.html { redirect_to @priklad, notice: 'Priklad was successfully updated.' }
        format.json { render :show, status: :ok, location: @priklad }
      else
        format.html { render :edit }
        format.json { render json: @priklad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /priklads/1
  # DELETE /priklads/1.json
  def destroy
    @priklad.destroy
    respond_to do |format|
      format.html { redirect_to priklads_url, notice: 'Priklad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_priklad
      @priklad = Priklad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def priklad_params
      params.require(:priklad).permit(:nazov, :text, :pred_t, :po_t, :vzorak, :autor, :kategoria, :stav, :cislo_v_kole)
    end
end
