require "spec_helper"

describe DisclaimersController do
  describe "routing" do

    it "routes to #index" do
      get("/disclaimers").should route_to("disclaimers#index")
    end

    it "routes to #new" do
      get("/disclaimers/new").should route_to("disclaimers#new")
    end

    it "routes to #show" do
      get("/disclaimers/1").should route_to("disclaimers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/disclaimers/1/edit").should route_to("disclaimers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/disclaimers").should route_to("disclaimers#create")
    end

    it "routes to #update" do
      put("/disclaimers/1").should route_to("disclaimers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/disclaimers/1").should route_to("disclaimers#destroy", :id => "1")
    end

  end
end
