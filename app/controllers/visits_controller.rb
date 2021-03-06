class VisitsController < ApplicationController
  # GET /clients/:client_id/visits
  # GET /clients/:client_id/visits.json
  def index
    @client = Client.find(params[:client_id])
    @visits = getSortedVisits(@client)
    @visit = @visits.last
    @events = generateEvents(@client)
    @disclaimer = Disclaimer.get_disclaimer

    @client.goals.each do |goal|
      goal.prepareGoalState(@visit)
    end
    
    @client.to_dos.each do |to_do|
      to_do.prepareToDoState(@visit)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @visits }
    end
  end

  # GET /clients/:client_id/visits/1
  # GET /clients/:client_id/visits/1.json
  def show
    begin
      @visit = Visit.find(params[:id])
      @client = Client.find(params[:client_id])
      @disclaimer = Disclaimer.get_disclaimer
      cookies[:last_visit] = @visit.id
      cookies[:last_client] = @client.id
      prepareShow()

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @visit }
        format.js
      end
    rescue ActiveRecord::RecordNotFound
      begin
        @client = Client.find(params[:client_id])
        redirect_to client_visit_path(@client, @client.getSortedVisits().last)
      rescue ActiveRecord::RecordNotFound
        redirect_to clients_path
      end
    end
    
  end

  # GET /clients/:client_id/visits/1/new
  # GET /clients/:client_id/visits/1/new.json
  def new
    @client = Client.find(params[:client_id])
    @visits = getSortedVisits(@client)
    #@visit = Visit.find(params[:id])
    @form_visit = Visit.new
    #@goal = Goal.new
    #@to_do = ToDo.new
    @goal_categories = GoalCategory.all
    @disclaimers = Disclaimers.all

    #@client.goals.each do |goal|
    #  goal.prepareGoalState(@visit)
    #end
    respond_to do |format|
      #format.html # show.html.erb
      format.json { render json: @visit }
      format.js
    end
  end
  
  # GET /clients/:client_id/visits/1/edit
  # GET /clients/:client_id/visits/1/edit.json
  def edit
    @client = Client.find(params[:client_id])
    @visits = @client.visits
    @visit = Visit.find(params[:id])
    @disclaimers = Disclaimers.all
  end

  # POST /clients/:client_id/visits
  # POST /clients/:client_id/visits.json
  def create
    #@visit = Visit.new(params[:visit])
    @visit = Visit.new
    @visit.visit_date = Date.today.to_time_in_current_zone
    @client = Client.find(params[:client_id])
    @visit.client = @client
    @goal_categories = GoalCategory.all
    
    respond_to do |format|
      
      if tryToSaveNewVisit(@visit)
      #if visit.save
        format.html { redirect_to client_visit_path(@visit.client, @visit), notice: 'Visit was successfully created.' }
        format.json { render json: @visit, status: :created, location: @visit }
      else
        prepareShow()
        @visit = @visits.last
        format.html { render action: "show" }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clients/:client_id/visits/1
  # PUT /clients/:client_id/visits/1.json
  def update
    @visit = Visit.find(params[:id])
    @goal_categories = GoalCategory.all

    respond_to do |format|
      if @visit.update_attributes(params[:visit])
        format.html { redirect_to client_visit_path(@visit.client), notice: 'Visit was successfully updated.' }
        format.json { head :no_content }
      else
        prepareShow()
        format.html { render action: "show" }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/:client_id/visits/1
  # DELETE /clients/:client_id/visits/1.json
  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy
    @goal_categories = GoalCategory.all
    
    unless @visit.errors.any?
      @visit = @visit.client.visits.last
    end
    
    @client = Client.find(params[:client_id])
    @client.goals.each do |goal|
      if goal.goal_states.empty?
        goal.destroy()
      end
    end
    
    prepareShow()

    respond_to do |format|
      format.html { render :show }
      format.json { head :no_content }
    end
  end

  def prepareShow()
    @client = Client.find(params[:client_id])
    @visits = getSortedVisits(@client)
    @form_visit = @visit
    @goal = Goal.new
    @to_do = ToDo.new
    @goal_categories = GoalCategory.all
    @events = generateEvents(@client)
    @disclaimers = Disclaimer.all

    @client.goals.each do |goal|
      goal.prepareGoalState(@visit)
    end
    
    @client.to_dos.each do |to_do|
      to_do.prepareToDoState(@visit)
    end
  end
  
  def getSortedVisits(client)
    @visits = client.visits
    sortVisits(@visits)
    return @visits
  end

  def sortVisits(visits)
      visits.sort! { |a,b| a.visit_date <=> b.visit_date }
  end

  def generateEvents(client)
    events = Array.new

    client.visits.each do |visit|
      events << visit
    end

    client.goals.each do |goal|
      events << goal
    end

    return events.sort! { |a,b| a.getDate() <=> b.getDate() }
  end

  def copyGoalsAndToDos(visit, client)
      if client.visits.length > 0
        @visits = getSortedVisits(client)
        copyGoals(visit, @visits.last)
        copyToDos(visit, @visits.last)
      end
  end

  def copyGoals(visit, lastVisit)
    lastVisit.goals.each do |goal|
      new_goal = goal.dup
      new_goal.visit = visit
      new_goal.save()
    end
  end

  def copyToDos(visit, lastVisit)
    lastVisit.to_dos.each do |to_do|
      new_to_do = to_do.dup
      new_to_do.visit = visit
      new_to_do.save()
    end
  end
  
  def tryToSaveNewVisit(visit)
    while not visit.save
      visit.visit_date = visit.visit_date + 1.days
    end
    return true
  end
  
end