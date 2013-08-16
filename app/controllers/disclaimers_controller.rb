class DisclaimersController < ApplicationController
  # GET /disclaimers
  # GET /disclaimers.json
  def index
    @disclaimers = Disclaimer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @disclaimers }
    end
  end

  # GET /disclaimers/1
  # GET /disclaimers/1.json
  def show
    @disclaimer = Disclaimer.find(params[:id])

    respond_to do |format|
      #format.html # show.html.erb
      format.json { render json: @disclaimer }
      format.js
    end
  end

  # GET /disclaimers/new
  # GET /disclaimers/new.json
  def new
    @disclaimer = Disclaimer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @disclaimer }
    end
  end

  # GET /disclaimers/1/edit
  def edit
    @disclaimer = Disclaimer.find(params[:id])
  end

  # POST /disclaimers
  # POST /disclaimers.json
  def create
    @disclaimer = Disclaimer.new(params[:disclaimer])

    respond_to do |format|
      if @disclaimer.save
        format.html { redirect_to presets_path, notice: 'Disclaimer was successfully created.' }
        format.json { render json: @disclaimer, status: :created, location: @disclaimer }
        format.js
      else
        format.html { redirect_to presets_path, notice: 'Disclaimer was successfully created.' }
        format.json { render json: @disclaimer.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /disclaimers/1
  # PUT /disclaimers/1.json
  def update
    @disclaimer = Disclaimer.find(params[:id])

    respond_to do |format|
      if @disclaimer.update_attributes(params[:disclaimer])
        format.html { redirect_to @disclaimer, notice: 'Disclaimer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @disclaimer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disclaimers/1
  # DELETE /disclaimers/1.json
  def destroy
    @disclaimer = Disclaimer.find(params[:id])
    @disclaimer.destroy

    respond_to do |format|
      format.html { redirect_to disclaimers_url }
      format.json { head :no_content }
      format.js
    end
  end
end
