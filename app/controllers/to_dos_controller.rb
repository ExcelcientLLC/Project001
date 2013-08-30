class ToDosController < ApplicationController
  # GET /to_dos
  # GET /to_dos.json
  def index
    @visit = Visit.find(:visit_id)
    @to_dos = ToDo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @to_dos }
    end
  end

  # GET /to_dos/1
  # GET /to_dos/1.json
  def show
    @to_do = ToDo.find(params[:id])
    @visit = Visit.find(params[:visit_id])
    @to_do.prepareToDoState(@visit)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @to_do }
      format.js
    end
  end

  # GET /to_dos/new
  # GET /to_dos/new.json
  def new
    @to_do = ToDo.new
    @visit = Visit.find(params[:visit_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @to_do }
      format.js
    end
  end

  # POST /to_dos
  # POST /to_dos.json
  def create
    @to_do = ToDo.new(params[:to_do])
    @visit = Visit.find(params[:visit_id])
    @client = Client.find(params[:client_id])
    @to_do.client = @client

    respond_to do |format|
      if @to_do.save
        saveToDoState(@to_do.complete, @visit, @to_do)
        format.html { redirect_to client_visits_path(@to_do.client), notice: 'To do was successfully created.' }
        format.json { render json: @to_do, status: :created, location: @to_do }
        format.js
      else
        format.html { redirect_to client_visits_path(@to_do.client) }
        format.json { render json: @to_do.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /to_dos/1
  # PUT /to_dos/1.json
  def update
    @to_do = ToDo.find(params[:id])
    @client = @to_do.client
    @visit = Visit.find(params[:visit_id])

    respond_to do |format|
      if @to_do.update_attributes(params[:to_do])
        @to_do_state = @to_do.getToDoStateForVisit(@visit)
        if @to_do_state == nil
          saveToDoState(@to_do.complete, @visit, @to_do)
        else
          @to_do_state.updateState(@to_do.complete)
          @to_do_state.save
        end
      
        format.html { redirect_to client_visits_path(@to_do.client), notice: 'To do was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { redirect_to client_visits_path(@todo.client) }
        format.json { render json: @to_do.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /to_dos/1
  # DELETE /to_dos/1.json
  def destroy
    @to_do = ToDo.find(params[:id])
    @visit = Visit.find(params[:visit_id])
    @client = @to_do.client
    @to_do.destroy

    if @to_do.errors.empty?
        @to_do = ToDo.new
    end

    
    respond_to do |format|
      format.html { redirect_to client_visits_path(@todo.client) }
      format.json { head :no_content }
      format.js
    end
  end
end

def saveToDoState(complete, visit, to_do)
    to_do_state = ToDoState.new()
    to_do_state.setup(to_do.complete, visit, to_do)
    to_do_state.save
  end