class GoalCategoriesController < ApplicationController
  # GET /goal_categories
  # GET /goal_categories.json
  def index
    @goal_categories = GoalCategory.all
    @goal_category = GoalCategory.new

    @last_visit = Visit.find(cookies[:last_visit].to_i)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @goal_categories }
    end
  end

  # GET /goal_categories/1
  # GET /goal_categories/1.json
  def show
    @goal_categories = GoalCategory.all
    @goal_category = GoalCategory.find(params[:id])

    respond_to do |format|
      #format.html # show.html.erb
      format.json { render json: @goal_category }
      format.js
    end
  end

  # GET /goal_categories/new
  # GET /goal_categories/new.json
  def new
    @goal_category = GoalCategory.new
    respond_to do |format|
      format.js # new.js.erb
    end
  end

  # POST /goal_categories
  # POST /goal_categories.json
  def create
    #@goal_category = GoalCategory.create( params[:goal_category] )
    @goal_categories = GoalCategory.all
    @goal_category = GoalCategory.new(params[:goal_category])
    @last_visit = Visit.find(cookies[:last_visit].to_i)
    
    respond_to do |format|
      if @goal_category.save
        @goal_categories = GoalCategory.all
        format.html { render :index } #, notice: 'Goal category was successfully created.' }
        format.json { render json: @goal_category, status: :created, location: @goal_category }
      	format.js
      else
        #format.html { render action: "new" }
        format.json { render json: @goal_category.errors, status: :unprocessable_entity }
	      format.js
      end
    end
  end

  # PUT /goal_categories/1
  # PUT /goal_categories/1.json
  def update
    @goal_categories = GoalCategory.all
    @goal_category = GoalCategory.find(params[:id])

    respond_to do |format|
      if @goal_category.update_attributes(params[:goal_category])
        @goal_categories = GoalCategory.all
        format.html { render :index } #, notice: 'Goal category was successfully updated.' }
        format.json { head :no_content }
        format.js
      else
        #format.html { render action: "edit" }
        format.json { render json: @goal_category.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /goal_categories/1
  # DELETE /goal_categories/1.json
  def destroy
    @goal_category = GoalCategory.find(params[:id])
    @goal_category.destroy
    @goal_categories = GoalCategory.all
    @goal_category = GoalCategory.new

    respond_to do |format|
      format.json { head :no_content }
      format.js
    end
  end
end
