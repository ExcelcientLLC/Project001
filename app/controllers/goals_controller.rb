class GoalsController < ApplicationController
  # GET /goals
  # GET /goals.json
  def index
    @goals = Goal.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @goals }
    end
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
    @goal = Goal.find(params[:id])
    @visit = @goal.visit

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
    @goal.visit = Visit.find(params[:visit_id])
    @visit = @goal.visit

    respond_to do |format|
      if @goal.save
        format.html { redirect_to client_visits_path(@goal.visit.client), notice: 'Goal was successfully created.' }
        format.json { render json: @goal, status: :created, location: @goal }
        format.js
      else
        format.html { redirect_to client_visits_path(@todo.visit.client) }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /goals/1
  # PUT /goals/1.json
  def update
    @goal = Goal.find(params[:id])
    @visit = @goal.visit

    respond_to do |format|
      if @goal.update_attributes(params[:goal])
        format.html { redirect_to client_visits_path(@todo.visit.client), notice: 'Goal was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { redirect_to client_visits_path(@todo.visit.client) }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal = Goal.find(params[:id])
    @visit = @goal.visit
    @goal.destroy

    respond_to do |format|
      format.html { redirect_to client_visits_path(@todo.visit.client) }
      format.json { head :no_content }
      format.js
    end
  end
end
