class SeriaController < ApplicationController
  before_action :set_serium, only: [:show, :edit, :update, :destroy]

  # GET /seria
  # GET /seria.json
  def index
    @seria = Serium.all
  end

  # GET /seria/1
  # GET /seria/1.json
  def show
  end

  # GET /seria/new
  def new
    @serium = Serium.new
  end

  # GET /seria/1/edit
  def edit
  end

  # POST /seria
  # POST /seria.json
  def create
    @serium = Serium.new(serium_params)

    respond_to do |format|
      if @serium.save
        format.html { redirect_to @serium, notice: 'Serium was successfully created.' }
        format.json { render :show, status: :created, location: @serium }
      else
        format.html { render :new }
        format.json { render json: @serium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seria/1
  # PATCH/PUT /seria/1.json
  def update
    respond_to do |format|
      if @serium.update(serium_params)
        format.html { redirect_to @serium, notice: 'Serium was successfully updated.' }
        format.json { render :show, status: :ok, location: @serium }
      else
        format.html { render :edit }
        format.json { render json: @serium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seria/1
  # DELETE /seria/1.json
  def destroy
    @serium.destroy
    respond_to do |format|
      format.html { redirect_to seria_url, notice: 'Serium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_serium
      @serium = Serium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def serium_params
      params.require(:serium).permit(:nazov, :rocnik)
    end
end
