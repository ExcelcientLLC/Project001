require 'spec_helper'
 
describe Client do
  it { should allow_mass_assignment_of :address}
  it { should allow_mass_assignment_of :city}
  it { should allow_mass_assignment_of :comment}
  it { should allow_mass_assignment_of :email}
  it { should allow_mass_assignment_of :first_name}
  it { should allow_mass_assignment_of :last_name}
  it { should allow_mass_assignment_of :phone}
  it { should allow_mass_assignment_of :state}
  it { should allow_mass_assignment_of :zip}

  it { should have_many :visits}

 describe "method tests" do

   before(:each) do
     Client.create(first_name: "Abe", last_name: "Rudder" )
     Client.create(first_name: "Sid", last_name: "The Kid" )
     Client.create(first_name: "Abbie", last_name: "Birthday" )
     Client.create(first_name: "Wonder", last_name: "About" )
   end

    it "should return all names that match" do
      clients = Client.search("Ab")
      clients.count.should == 3
      clients[2].first_name.should == "Abe"
      clients[1].first_name.should == "Abbie"
      clients[0].last_name.should == "About"
    end

    it "should default to sorting by last name asc" do
      clients = Client.all
      #clinets[0].last_name.should == "About"
      #clients[1].last_name.should == "Birthday"
      #clients[2].last_name.should == "Rudder"
      #clients[3].last_name.should == "The Kid"
    end

  end
 
end
