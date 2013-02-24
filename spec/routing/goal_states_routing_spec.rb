require "spec_helper"

describe GoalStatesController do
  describe "routing" do

    it "routes to #index" do
      get("/goal_states").should route_to("goal_states#index")
    end

    it "routes to #new" do
      get("/goal_states/new").should route_to("goal_states#new")
    end

    it "routes to #show" do
      get("/goal_states/1").should route_to("goal_states#show", :id => "1")
    end

    it "routes to #edit" do
      get("/goal_states/1/edit").should route_to("goal_states#edit", :id => "1")
    end

    it "routes to #create" do
      post("/goal_states").should route_to("goal_states#create")
    end

    it "routes to #update" do
      put("/goal_states/1").should route_to("goal_states#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/goal_states/1").should route_to("goal_states#destroy", :id => "1")
    end

  end
end
