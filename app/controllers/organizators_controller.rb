class OrganizatorsController < ApplicationController
  before_action :set_organizator, only: [:show, :edit, :update, :destroy]

  # GET /organizators
  # GET /organizators.json
  def index
    @organizators = Organizator.all
  end

  # GET /organizators/1
  # GET /organizators/1.json
  def show
  end

  # GET /organizators/new
  def new
    @organizator = Organizator.new
  end

  # GET /organizators/1/edit
  def edit
  end

  # POST /organizators
  # POST /organizators.json
  def create
    @organizator = Organizator.new(organizator_params)

    respond_to do |format|
      if @organizator.save
        format.html { redirect_to organizators_path, notice: 'org_add' }
        format.json { render :show, status: :created, location: @organizator }
      else
        format.html { render :new }
        format.json { render json: @organizator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizators/1
  # PATCH/PUT /organizators/1.json
  def update
    respond_to do |format|
      if @organizator.update(organizator_params)
        format.html { redirect_to organizators_path, notice: 'org_edit' }
        format.json { render :show, status: :ok, location: @organizator }
      else
        format.html { render :edit }
        format.json { render json: @organizator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizators/1
  # DELETE /organizators/1.json
  def destroy
    @organizator.destroy
    respond_to do |format|
      format.html { redirect_to organizators_url, notice: 'org_destroy' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organizator
      @organizator = Organizator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organizator_params
      params.require(:organizator).permit(:meno, :priezvisko, :nick, :status, :email, :telefon)
    end
end
