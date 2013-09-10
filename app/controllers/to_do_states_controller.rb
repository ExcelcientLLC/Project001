class ToDoStatesController < ApplicationController
  # GET /to_do_states
  # GET /to_do_states.json
  def index
    @to_do_states = ToDoState.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @to_do_states }
    end
  end

  # GET /to_do_states/1
  # GET /to_do_states/1.json
  def show
    @to_do_state = ToDoState.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @to_do_state }
    end
  end

  # GET /to_do_states/new
  # GET /to_do_states/new.json
  def new
    @to_do_state = ToDoState.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @to_do_state }
    end
  end

  # GET /to_do_states/1/edit
  def edit
    @to_do_state = ToDoState.find(params[:id])
  end

  # POST /to_do_states
  # POST /to_do_states.json
  def create
    @to_do_state = ToDoState.new(params[:to_do_state])

    respond_to do |format|
      if @to_do_state.save
        format.html { redirect_to @to_do_state, notice: 'To do state was successfully created.' }
        format.json { render json: @to_do_state, status: :created, location: @to_do_state }
      else
        format.html { render action: "new" }
        format.json { render json: @to_do_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /to_do_states/1
  # PUT /to_do_states/1.json
  def update
    @to_do_state = ToDoState.find(params[:id])

    respond_to do |format|
      if @to_do_state.update_attributes(params[:to_do_state])
        format.html { redirect_to @to_do_state, notice: 'To do state was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @to_do_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /to_do_states/1
  # DELETE /to_do_states/1.json
  def destroy
    @to_do_state = ToDoState.find(params[:id])
    @to_do_state.destroy

    respond_to do |format|
      format.html { redirect_to to_do_states_url }
      format.json { head :no_content }
    end
  end
end
