require 'spec_helper'
 
describe ClientsController do
 
  describe "GET #index" do
    before :each do
      #Client.destroy
    end
     
    it "assigns all @clients" do
      client = Client.create
      get :index
      assigns(:clients).should eq([client])
    end
  
    #it "assigns all @clients" do
      #client1 = Client.create(first_name: "Hupert")
      #client2 = Client.create(first_name: "Rupert")
      #client3 = Client.create(first_name: "Oliver")
      
      #assigns(:clients).should eq([client1, client3, client2])
    #end          
                       
    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end
   
end
