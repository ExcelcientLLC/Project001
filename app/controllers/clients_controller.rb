class ClientsController < ApplicationController
  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
    @client = Client.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clients }
    end
  end
  
  # GET /clients/1
  # GET /clients/1.json
  def show
    @clients = Client.all
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @client }
      format.js
    end
  end
  
  # GET /clients/new
  # GET /clients/new.json
  def new
    @client = Client.new

    respond_to do |format|
      format.js # new.html.erb
    end
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(params[:client])
    @clients = Client.all

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render json: @client, status: :created, location: @client }
        format.js
      else
        format.html { render action: "index" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.json
  def update
    @client = Client.find(params[:id])
    @clients = Client.all

    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { render action: "index" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    @clients = Client.all
    @client = Client.new

    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
      format.js
    end
  end
end
