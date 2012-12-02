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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @to_do }
      format.js
    end
  end

  # GET /to_dos/1/edit
  def edit
    @to_do = ToDo.find(params[:id])
  end

  # POST /to_dos
  # POST /to_dos.json
  def create
    @to_do = ToDo.new(params[:to_do])
    @to_do.visit = Visit.find(params[:visit_id])
    @visit = @to_do.visit

    respond_to do |format|
      if @to_do.save
        format.html { redirect_to client_visits_path(@todo.visit.client), notice: 'To do was successfully created.' }
        format.json { render json: @to_do, status: :created, location: @to_do }
        format.js
      else
        format.html { redirect_to client_visits_path(@todo.visit.client) }
        format.json { render json: @to_do.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /to_dos/1
  # PUT /to_dos/1.json
  def update
    @to_do = ToDo.find(params[:id])
    @visit = @to_do.visit

    respond_to do |format|
      if @to_do.update_attributes(params[:to_do])
        format.html { redirect_to client_visits_path(@todo.visit.client), notice: 'To do was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        format.html { redirect_to client_visits_path(@todo.visit.client) }
        format.json { render json: @to_do.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /to_dos/1
  # DELETE /to_dos/1.json
  def destroy
    @to_do = ToDo.find(params[:id])
    @visit = @to_do.visit
    @to_do.destroy

    respond_to do |format|
      format.html { redirect_to client_visits_path(@todo.visit.client) }
      format.json { head :no_content }
      format.js
    end
  end
end
