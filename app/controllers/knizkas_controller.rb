class KnizkasController < ApplicationController
  before_action :set_knizka, only: [:show, :edit, :update, :destroy, :add_obsah, :remove_obsah, :zadania, :vzoraky, :vysledkovka, :clanok, :gen_pdf]


  def zadania
    @obsah = KnizkaObsah.find(params[:format])
    @c_kolo = @obsah.nazov.split('Zadania ')[1].split('. kola')[0]
    @kolo = Kolo.where(rocnik: @knizka.rocnik, seria: @knizka.seria, cislo: @c_kolo).take
    @priklady = @kolo.priklads.order(:cislo_v_kole)
  end

  def vzoraky

  end

  def vysledkovka

  end

  def clanok

  end

  # GET /knizkas
  # GET /knizkas.json
  def index
    @knizkas = Knizka.all
  end

  # GET /knizkas/1
  # GET /knizkas/1.json
  def show
    @pridany_obsah = @knizka.knizka_obsahs
    @obsah = []
    (1..3).each do |i|
      @obsah << { id: "z1", name: "Zadania #{i}. kola", link: nil } if @pridany_obsah.where(nazov: "Zadania #{i}. kola").count == 0
      @obsah << { id: "vz1", name: "Vzoráky #{i}. kola", link: nil } if @pridany_obsah.where(nazov: "Vzoráky #{i}. kola").count == 0
      @obsah << { id: "vy1", name: "Výsledkovka #{i}. kola", link: nil } if @pridany_obsah.where(nazov: "Výsledkovka #{i}. kola").count == 0
    end
  end

  def add_obsah
    if !params[:obsah].blank?
      params[:obsah].each do |obsah|
        max = @knizka.knizka_obsahs.order('cislo DESC').first
        if max
          max = max.cislo
        else
          max = 0
        end
        if obsah.starts_with?('z')
          cislo = obsah.split('z')[1]
          @knizka.knizka_obsahs.create(nazov: "Zadania #{cislo}. kola", cislo: (max + 1))
        elsif obsah.starts_with?('vz')
          cislo = obsah.split('vz')[1]
          @knizka.knizka_obsahs.create(nazov: "Vzoráky #{cislo}. kola", cislo: (max + 1))
        elsif obsah.starts_with?('vy')
          cislo = obsah.split('vy')[1]
          @knizka.knizka_obsahs.create(nazov: "Výsledkovka #{cislo}. kola", cislo: (max + 1))
        end
      end
    end
    if !params[:clanok_cnt].blank?
      params[:clanok_cnt].to_i.times do |i|
        max = @knizka.knizka_obsahs.order('cislo DESC').first
        if max
          max = max.cislo
        else
          max = 0
        end
        @knizka.knizka_obsahs.create(nazov: 'Článok', cislo: (max + 1))
      end
    end
    if !params[:obsah].blank? || !params[:clanok_cnt].blank?
      redirect_to :back, notice: 'ok'
    else
      redirect_to :back, notice: 'nothing_added'
    end
  end

  def remove_obsah
    unless params[:format].blank?
      k = KnizkaObsah.find(params[:format])
      por = k.cislo
      @knizka.knizka_obsahs.where('`cislo` > ?', por).each do |kkk|
        kkk.update(cislo: kkk.cislo - 1)
      end
      k.destroy

      redirect_to :back, notice: 'removed'
    end
  end

  def gen_pdf
    @knizka.pdfs.create
    redirect_to :back, notice: 'pdf_ok'
  end

  # GET /knizkas/new
  def new
    @seria = Serium.find(params[:serium_id])
    @rocnik = Rocnik.find_by_cislo(@seria.rocnik)
    max = Knizka.where(rocnik: @rocnik.cislo, seria: @seria.nazov).order('cislo DESC').first
    if !max
      max = -1
    else
      max = max.cislo
    end
    Knizka.create(cislo: max + 1, rocnik: @rocnik.cislo, seria: @seria.nazov)
    redirect_to :back, notice: 'knizka_added'
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
