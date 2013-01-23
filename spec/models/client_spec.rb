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

    it "should return all first names that match" do
      clients = Client.new(first_name: "Abe")
      results = clients.search("Abe")
      puts "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxXXXXXxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxXXXX"
      results.first.should == "Abe"
    end
 
end
