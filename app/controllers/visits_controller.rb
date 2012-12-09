class VisitsController < ApplicationController
  # GET /clients/:client_id/visits
  # GET /clients/:client_id/visits.json
  def index
    @client = Client.find(params[:client_id])
    @visits = @client.visits
    @curr_visit = @visits.last
    @visit = Visit.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @visits }
    end
  end

  # GET /clients/:client_id/visits/1
  # GET /clients/:client_id/visits/1.json
  def show
    @client = Client.find(params[:client_id])
    @visits = @client.visits
    @visit = Visit.find(params[:id])
    @goal = Goal.new
    @to_do = ToDo.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @visit }
    end
  end
  
  # GET /clients/:client_id/visits/1/edit
  # GET /clients/:client_id/visits/1/edit.json
  def edit
    @client = Client.find(params[:client_id])
    @visits = @client.visits
    @visit = Visit.find(params[:id])
  end

  # POST /clients/:client_id/visits
  # POST /clients/:client_id/visits.json
  def create
    @visit = Visit.new(params[:visit])
    @visit.client = Client.find(params[:client_id])

    respond_to do |format|
      if not @visit.save
        format.html { redirect_to client_visits_path(@visit.client), notice: 'Visit was successfully created.' }
        format.json { render json: @visit, status: :created, location: @visit }
      else
        format.html { redirect_to client_visits_path(@visit.client) }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clients/:client_id/visits/1
  # PUT /clients/:client_id/visits/1.json
  def update
    @visit = Visit.find(params[:id])

    respond_to do |format|
      if @visit.update_attributes(params[:visit])
        format.html { redirect_to edit_client_visit_path(@visit.client), notice: 'Visit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to client_visits_path(@visit.client)}
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/:client_id/visits/1
  # DELETE /clients/:client_id/visits/1.json
  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy

    respond_to do |format|
      format.html { redirect_to client_visits_path(@visit.client) }
      format.json { head :no_content }
    end
  end
end
