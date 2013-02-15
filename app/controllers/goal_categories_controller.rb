class GoalCategoriesController < ApplicationController
  # GET /goal_categories
  # GET /goal_categories.json
  def index
    @goal_categories = GoalCategory.all
    @goal_category = GoalCategory.new


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @goal_categories }
    end
  end

  # GET /goal_categories/1
  # GET /goal_categories/1.json
  def show
    @goal_category = GoalCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @goal_category }
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
    @goal_category = GoalCategory.new(params[:goal_category])

    respond_to do |format|
      if @goal_category.save
        format.html { redirect_to @goal_category, notice: 'Goal category was successfully created.' }
        format.json { render json: @goal_category, status: :created, location: @goal_category }
	format.js
      else
        format.html { render action: "new" }
        format.json { render json: @goal_category.errors, status: :unprocessable_entity }
	format.js
      end
    end
  end

  # PUT /goal_categories/1
  # PUT /goal_categories/1.json
  def update
    @goal_category = GoalCategory.find(params[:id])

    respond_to do |format|
      if @goal_category.update_attributes(params[:goal_category])
        format.html { redirect_to @goal_category, notice: 'Goal category was successfully updated.' }
        format.json { head :no_content }
	format.js
      else
        format.html { render action: "edit" }
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
    @clients = Client.all
    @client = Client.new

    respond_to do |format|
      format.html { redirect_to goal_categories_url }
      format.json { head :no_content }
      format.js
    end
  end
end
