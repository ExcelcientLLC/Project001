class ClientsController < ApplicationController
  helper_method :sort_column, :sort_direction

  # GET /clients
  # GET /clients.json
  def index
    puts params
    puts params[:filter]
    
    @clients = get_clients 
    @client = Client.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clients }
    end
  end
  
  # GET /clients/1
  # GET /clients/1.json
  def show
    @clients = get_clients
    @client = Client.find(params[:id])

    respond_to do |format|
      #format.html # show.html.erb
      format.json { render json: @client }
      format.js
    end
  end
  
  # GET /clients/new
  # GET /clients/new.json
  def new
    @clients = get_clients
    @client = Client.new

    respond_to do |format|
      format.js # new.js.erb
    end
  end

  # POST /clients
  # POST /clients.json
  def create
    @clients = get_clients
    @client = Client.new(params[:client])

    respond_to do |format|
      if @client.save
        @clients = get_clients
        newVisitOnCreate(@client)
        #format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render json: @client, status: :created, location: @client }
        format.js
      else
        #format.html { render action: "index" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.json
  def update
    @clients = get_clients
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        @clients = get_clients
        #format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        #format.html { render action: "index" }
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
    @clients = get_clients
    @client = Client.new

    respond_to do |format|
      #format.html { redirect_to clients_url }
      format.json { head :no_content }
      format.js
    end
  end

  def newVisitOnCreate(client)
    visit = Visit.new
    visit.visit_date = Date.today.to_time_in_current_zone
    visit.client = client
    visit.save
  end


  private
  
  def sort_column
    Client.column_names.include?(params[:sort]) ? params[:sort] : "first_name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
  def get_clients
    if not params[:filter]
      params[:filter_text] = ""
    end
    return Client.search(params[:filter_text]).order(sort_column + " " + sort_direction)
  end
end
