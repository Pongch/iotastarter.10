class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all.order("total DESC")
    @project = Project

    respond_to do |format|
      format.html
      format.json { render json: @projects }
    end

    @donations = Donation.approved
    @pending_donations = Donation.pending

  end


  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.friendly.find(params[:id])
    @donations = @project.donations.approved.order("amount DESC")
    #begins the IOTA WALLET GET BALANCE ()

    require 'net/http'
    require 'uri'
    require 'json'

    uri = URI.parse("http://iota.bitfinex.com:80")
    request = Net::HTTP::Post.new(uri)
    request.content_type = "application/json"
    request.body = JSON.dump({
      "command" => "getBalances",
      "addresses" => [
        @project.address.to_s
      ],
      "threshold" => 100
    })

    req_options = {
      use_ssl: uri.scheme == "https",
    }

    response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      the_request = http.request(request)
    end

    balance_array = JSON.parse(response.body)

    @show_balance = balance_array["balances"].to_f/1000000

    #ends API Call

    respond_to do |format|
      format.html
      format.json { render json: @project}
    end

  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_project
      @project = Project.friendly.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :description, :owner, :total, :category, :address, :url, :email)
    end
end
