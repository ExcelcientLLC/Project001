class VisitsController < ApplicationController
  # GET /clients/:client_id/visits
  # GET /clients/:client_id/visits.json
  def index
    @client = Client.find(params[:client_id])
    @visits = getSortedVisits(@client)
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
    @visits = getSortedVisits(@client)
    @visit = Visit.find(params[:id])
    @curr_visit = @visit
    @goal = Goal.new
    @to_do = ToDo.new
    @goal_categories = GoalCategory.all

    respond_to do |format|
      format.html # show.html.erb
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
  end

  # POST /clients/:client_id/visits
  # POST /clients/:client_id/visits.json
  def create
    @visit = Visit.new(params[:visit])
    @visit.client = Client.find(params[:client_id])
    @goal_categories = GoalCategory.all

    #puts "Calling copyGoalsAndToDos"
    #copyGoalsAndToDos(@visit, @visit.client)
    #puts "Done Calling copyGoalsAndToDos"

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
    @goal_categories = GoalCategory.all

    respond_to do |format|
      if @visit.update_attributes(params[:visit])
        format.html { redirect_to client_visit_path(@visit.client), notice: 'Visit was successfully updated.' }
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
    @goal_categories = GoalCategory.all

    respond_to do |format|
      format.html { redirect_to client_visits_path(@visit.client) }
      format.json { head :no_content }
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

  def copyGoalsAndToDos(visit, client)
      if client.visits.length > 0
        @visits = getSortedVisits(client)
        copyGoals(visit, @visits.last)
        copyToDos(visit, @visits.last)
      end
  end

  def copyGoals(visit, lastVisit)
    puts "Copying Visit Goals"
    puts lastVisit.goals.length
    lastVisit.goals.each do |goal|
      puts goal.name
      new_goal = goal.dup
      new_goal.visit = visit
      new_goal.save()
    end
  end

  def copyToDos(visit, lastVisit)
    puts "Copying Visit To Dos"
    puts lastVisit.to_dos.length
    lastVisit.to_dos.each do |to_do|
      puts to_do.title
      new_to_do = to_do.dup
      new_to_do.visit = visit
      new_to_do.save()
    end
  end
end
