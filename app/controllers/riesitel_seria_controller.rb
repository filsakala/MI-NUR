class RiesitelSeriaController < ApplicationController
  before_action :set_riesitel_serium, only: [:show, :edit, :update, :destroy]

  # GET /riesitel_seria
  # GET /riesitel_seria.json
  def index
    if !params[:id].blank?
      @riesitel_seria = RiesitelSerium.find_by_seria_id(params[:id])
      return
    end
    if !params[:riesitelia_ids].blank?
      @riesitel_seria = RiesitelSerium.find(params[:riesitelia_ids])
      return
    end
    @riesitel_seria = nil
  end

  def riesitelia_serie
    if !params[:id].blank?
      @riesitel_seria = RiesitelSerium.where(seria_id: params[:id])
      return
    end
    if !params[:riesitelia_ids].blank?
      @riesitel_seria = RiesitelSerium.find(params[:riesitelia_ids])
      return
    end
    @riesitel_seria = nil
  end

  # POST /riesitel_seria
  # POST /riesitel_seria.json
  def create
    @riesitel_serium = RiesitelSerium.new(riesitel_serium_params)

    respond_to do |format|
      if @riesitel_serium.save
        format.html { redirect_to @riesitel_serium, notice: 'Riesitel serium was successfully created.' }
        format.json { render :show, status: :created, location: @riesitel_serium }
      else
        format.html { render :new }
        format.json { render json: @riesitel_serium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /riesitel_seria/1
  # PATCH/PUT /riesitel_seria/1.json
  def update
    respond_to do |format|
      if @riesitel_serium.update(riesitel_serium_params)
        format.html { redirect_to @riesitel_serium, notice: 'Riesitel serium was successfully updated.' }
        format.json { render :show, status: :ok, location: @riesitel_serium }
      else
        format.html { render :edit }
        format.json { render json: @riesitel_serium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /riesitel_seria/1
  # DELETE /riesitel_seria/1.json
  def destroy
    @riesitel_serium.destroy
    respond_to do |format|
      format.html { redirect_to riesitel_seria_url, notice: 'Riesitel serium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit_riesitels
    if !params[:ids].blank?
      riesitel = nil
      sID = nil
      params[:ids].each_with_index do |id, index|
        riesitel = RiesitelSerium.find(id)
        riesitel.skola = params[:skola][index]
        riesitel.trieda = params[:trieda][index]
        riesitel.kategoria = params[:kategoria][index]
        riesitel.eriesitel = false
        sID = riesitel.seria_id
        if !params[:eriesitelia].blank?
          params[:eriesitelia].each do |eId|
            riesitel.eriesitel = true if eId == id
          end
        end
        if !params[:delete].blank?
          params[:delete].each do |dId|
            if dId == id
              riesitel.destroy
              riesitel = nil
            end
          end
        end
        if riesitel != nil
          riesitel.save
        end
      end
    end
    redirect_to url_for(:controller => 'riesitel_seria', :action => 'riesitelia_serie', id: sID)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_riesitel_serium
    @riesitel_serium = RiesitelSerium.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def riesitel_serium_params
    params.require(:riesitel_serium).permit(:skola, :trieda, :kategoria, :eriesitel, :rocnik, :seria)
  end

end
