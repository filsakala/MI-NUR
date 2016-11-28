class OpravasController < ApplicationController
  before_action :set_oprava, only: [:show, :update, :destroy]

  # GET /opravas
  # GET /opravas.json
  def index
    @oprava = Oprava.where(rocnik: params[:rocnik], seria: params[:seria], kolo: params[:kolo]).take
    if !@oprava
      @oprava = Oprava.create(rocnik: params[:rocnik], seria: params[:seria], kolo: params[:kolo])
    end
    if !@oprava.priklady.blank?
      @priklady = eval(@oprava.priklady)
    else
      @priklady = []
    end
  end

  # GET /opravas/1
  # GET /opravas/1.json
  def show
  end

  # GET /opravas/new
  def new
    @oprava = Oprava.where(rocnik: params[:rocnik], seria: params[:seria], kolo: params[:kolo]).take
    if !@oprava.priklady.blank?
      @priklady = eval(@oprava.priklady)
    else
      @priklady = []
    end
    if @priklady.include?(params[:priklad])
      @priklady = @priklady - [params[:priklad]]
    else
      @priklady = @priklady + [params[:priklad]]
    end
    @oprava.update(priklady: @priklady.to_s)
    redirect_to opravas_path(rocnik: params[:rocnik], seria: params[:seria], kolo: params[:kolo]), notice: 'oprava_add'
  end

  # GET /opravas/1/edit
  def edit
    @oprava = Oprava.where(rocnik: params[:rocnik], seria: params[:seria], kolo: params[:kolo]).take
    if !@oprava
      @oprava = Oprava.create(rocnik: params[:rocnik], seria: params[:seria], kolo: params[:kolo])
    end
    if !@oprava.priklady.blank?
      @priklady = eval(@oprava.priklady)
    else
      @priklady = []
    end
    if @priklady.size == 1
      pr = Priklad.where(kolo: Kolo.where(rocnik: params[:rocnik], seria: params[:seria], cislo: params[:kolo]).take, cislo_v_kole: @priklady[0]).take
      redirect_to edit_priklad_path(pr) if pr
    end
  end

  # POST /opravas
  # POST /opravas.json
  def create
    @oprava = Oprava.new(oprava_params)

    respond_to do |format|
      if @oprava.save
        format.html { redirect_to @oprava, notice: 'Oprava was successfully created.' }
        format.json { render :show, status: :created, location: @oprava }
      else
        format.html { render :new }
        format.json { render json: @oprava.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /opravas/1
  # PATCH/PUT /opravas/1.json
  def update
    respond_to do |format|
      if @oprava.update(oprava_params)
        format.html { redirect_to @oprava, notice: 'Oprava was successfully updated.' }
        format.json { render :show, status: :ok, location: @oprava }
      else
        format.html { render :edit }
        format.json { render json: @oprava.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /opravas/1
  # DELETE /opravas/1.json
  def destroy
    @oprava.destroy
    respond_to do |format|
      format.html { redirect_to opravas_url, notice: 'Oprava was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_oprava
    @oprava = Oprava.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def oprava_params
    params.require(:oprava).permit(:rocnik, :seria, :kolo, :priklady)
  end
end
