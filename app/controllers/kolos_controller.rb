class KolosController < ApplicationController
  before_action :set_kolo, only: [:show, :edit, :update, :destroy, :add_priklads, :remove_priklad]

  # GET /kolos
  # GET /kolos.json
  def index
    @kolos = Kolo.all
  end

  # GET /kolos/1
  # GET /kolos/1.json
  def show
    @priklads = Priklad.where(kolo_id: nil)
  end

  def add_priklads
    pr_cnt = @kolo.priklads.count

    unless params[:priklads].blank?
      if params[:priklads].size + pr_cnt > 10
        redirect_to :back, notice: 'too_many_priklads'
      else
        params[:priklads].each do |p|
          priklad = Priklad.find(p)
          new_cislo = 0
          (1..10).each do |c|
            unless @kolo.priklads.where(cislo_v_kole: c).take
              new_cislo = c
              break
            end
          end
          if new_cislo != 0
            priklad.update(kolo: @kolo, cislo_v_kole: new_cislo)
          end
        end

        redirect_to :back, notice: 'ok'
      end
    else
      redirect_to :back, notice: 'no_priklads'
    end
  end

  def remove_priklad
    ps = @kolo.priklads.where(cislo_v_kole: params[:format])
    ps.each do |p|
      p.update(kolo: nil, cislo_v_kole: nil)
    end
    redirect_to :back, notice: 'deleted'
  end

  # GET /kolos/new
  def new
    @kolo = Kolo.new
  end

  # GET /kolos/1/edit
  def edit
  end

  # POST /kolos
  # POST /kolos.json
  def create
    @kolo = Kolo.new(kolo_params)

    respond_to do |format|
      if @kolo.save
        format.html { redirect_to @kolo, notice: 'Kolo was successfully created.' }
        format.json { render :show, status: :created, location: @kolo }
      else
        format.html { render :new }
        format.json { render json: @kolo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kolos/1
  # PATCH/PUT /kolos/1.json
  def update
    respond_to do |format|
      if @kolo.update(kolo_params)
        format.html { redirect_to @kolo, notice: 'Kolo was successfully updated.' }
        format.json { render :show, status: :ok, location: @kolo }
      else
        format.html { render :edit }
        format.json { render json: @kolo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kolos/1
  # DELETE /kolos/1.json
  def destroy
    @kolo.destroy
    respond_to do |format|
      format.html { redirect_to kolos_url, notice: 'Kolo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_kolo
    @kolo = Kolo.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def kolo_params
    params.require(:kolo).permit(:cislo, :rocnik, :seria)
  end
end
