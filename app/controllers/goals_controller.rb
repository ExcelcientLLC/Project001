class GoalsController < ApplicationController
  # GET /goals
  # GET /goals.json
  def index
    @client = Client.find(params[:client_id])
    @visit = Visit.find(params[:visit_id])
    @goals = @client.goals

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @goals }
    end
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
    @goal = Goal.find(params[:id])
    @goal_categories = GoalCategory.all
    @visit = Visit.find(params[:visit_id])
    @goal.prepareGoalState(@visit)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @goal }
      format.js
    end
  end

  # GET /goals/new
  # GET /goals/new.json
  def new
    @goal = Goal.new
    @goal_categories = GoalCategory.all
    @visit = Visit.find(params[:visit_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @goal }
      format.js
    end
  end

  # GET /goals/1/edit
  def edit
    @goal = Goal.find(params[:id])
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = Goal.new(params[:goal])
    @visit = Visit.find(params[:visit_id])
    @client = Client.find(params[:client_id])
    @goal.client = @client
    @goal_categories = GoalCategory.all

    respond_to do |format|
      if @goal.save
        saveGoalState(@goal.current_value, @goal.current_expenditures, @visit, @goal)
        format.html { redirect_to client_visits_path(@goal.visit.client), notice: 'Goal was successfully created.' }
        format.json { render json: @goal, status: :created, location: @goal }
        format.js
      else
        format.html { render "new" }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
        format.js   { render "new" }
      end
    end
  end

  # PUT /goals/1
  # PUT /goals/1.json
  def update
    @goal = Goal.find(params[:id])
    @client = @goal.client
    @goal_categories = GoalCategory.all
    @visit = Visit.find(params[:visit_id])

    respond_to do |format|
      if @goal.update_attributes(params[:goal])
        @goal_state = @goal.getGoalStateForVisit(@visit)
        if @goal_state == nil
          saveGoalState(@goal.current_value, @goal.current_expenditures, @visit, @goal)
        else
          @goal_state.updateState(@goal.current_value, @goal.current_expenditures)
          @goal_state.save
        end

        format.html { redirect_to client_visits_path(@goal.client), notice: 'Goal was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { redirect_to client_visits_path(@goal.client) }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
        format.js   { render "show" }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal = Goal.find(params[:id])
    @goal_categories = GoalCategory.all
    @visit = Visit.find(params[:visit_id])
    @client = @goal.client
    @goal.destroy
    
    if @goal.errors.empty?
        @goal = Goal.new
    end

    respond_to do |format|
      format.html { redirect_to client_visits_path(@goal.visit.client) }
      format.json { head :no_content }
      format.js
    end
  end

  def saveGoalState(current_value, current_expenditures, visit, goal)
    goal_state = GoalState.new()
    goal_state.setup(goal.current_value, goal.current_expenditures, visit, goal)
    goal_state.save
  end
end
