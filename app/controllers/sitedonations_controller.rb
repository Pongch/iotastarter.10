class SitedonationsController < ApplicationController
  before_action :set_sitedonation, only: [:show, :edit, :update, :destroy]

  # GET /sitedonations
  # GET /sitedonations.json
  def index
    @sitedonations = Sitedonation.approved.order("amount DESC")
  end

  # GET /sitedonations/1
  # GET /sitedonations/1.json
  def show
  end

  # GET /sitedonations/new
  def new
    @sitedonation = Sitedonation.new
  end

  # GET /sitedonations/1/edit
  def edit
  end

  # POST /sitedonations
  # POST /sitedonations.json
  def create
    @sitedonation = Sitedonation.new(sitedonation_params)

    respond_to do |format|
      if @sitedonation.save
        format.html { redirect_to sitedonations_path, notice: 'Sitedonation was successfully created.' }
        format.json { render :show, status: :created, location: @sitedonation }
      else
        format.html { render :new }
        format.json { render json: @sitedonation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sitedonations/1
  # PATCH/PUT /sitedonations/1.json
  def update
    respond_to do |format|
      if @sitedonation.update(sitedonation_params)
        format.html { redirect_to @sitedonation, notice: 'Sitedonation was successfully updated.' }
        format.json { render :show, status: :ok, location: @sitedonation }
      else
        format.html { render :edit }
        format.json { render json: @sitedonation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sitedonations/1
  # DELETE /sitedonations/1.json
  def destroy
    @sitedonation.destroy
    respond_to do |format|
      format.html { redirect_to sitedonations_url, notice: 'Sitedonation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sitedonation
      @sitedonation = Sitedonation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sitedonation_params
      params.require(:sitedonation).permit(:name, :amount, :email, :tag, :url)
    end
end
