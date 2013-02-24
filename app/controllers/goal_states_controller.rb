class GoalStatesController < ApplicationController
  # GET /goal_states
  # GET /goal_states.json
  def index
    @goal_states = GoalState.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @goal_states }
    end
  end

  # GET /goal_states/1
  # GET /goal_states/1.json
  def show
    @goal_state = GoalState.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @goal_state }
    end
  end

  # GET /goal_states/new
  # GET /goal_states/new.json
  def new
    @goal_state = GoalState.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @goal_state }
    end
  end

  # GET /goal_states/1/edit
  def edit
    @goal_state = GoalState.find(params[:id])
  end

  # POST /goal_states
  # POST /goal_states.json
  def create
    @goal_state = GoalState.new(params[:goal_state])

    respond_to do |format|
      if @goal_state.save
        format.html { redirect_to @goal_state, notice: 'Goal state was successfully created.' }
        format.json { render json: @goal_state, status: :created, location: @goal_state }
      else
        format.html { render action: "new" }
        format.json { render json: @goal_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /goal_states/1
  # PUT /goal_states/1.json
  def update
    @goal_state = GoalState.find(params[:id])

    respond_to do |format|
      if @goal_state.update_attributes(params[:goal_state])
        format.html { redirect_to @goal_state, notice: 'Goal state was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @goal_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goal_states/1
  # DELETE /goal_states/1.json
  def destroy
    @goal_state = GoalState.find(params[:id])
    @goal_state.destroy

    respond_to do |format|
      format.html { redirect_to goal_states_url }
      format.json { head :no_content }
    end
  end
end
