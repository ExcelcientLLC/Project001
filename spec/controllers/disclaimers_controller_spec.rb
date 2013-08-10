require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe DisclaimersController do

  # This should return the minimal set of attributes required to create a valid
  # Disclaimer. As you add validations to Disclaimer, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DisclaimersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all disclaimers as @disclaimers" do
      disclaimer = Disclaimer.create! valid_attributes
      get :index, {}, valid_session
      assigns(:disclaimers).should eq([disclaimer])
    end
  end

  describe "GET show" do
    it "assigns the requested disclaimer as @disclaimer" do
      disclaimer = Disclaimer.create! valid_attributes
      get :show, {:id => disclaimer.to_param}, valid_session
      assigns(:disclaimer).should eq(disclaimer)
    end
  end

  describe "GET new" do
    it "assigns a new disclaimer as @disclaimer" do
      get :new, {}, valid_session
      assigns(:disclaimer).should be_a_new(Disclaimer)
    end
  end

  describe "GET edit" do
    it "assigns the requested disclaimer as @disclaimer" do
      disclaimer = Disclaimer.create! valid_attributes
      get :edit, {:id => disclaimer.to_param}, valid_session
      assigns(:disclaimer).should eq(disclaimer)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Disclaimer" do
        expect {
          post :create, {:disclaimer => valid_attributes}, valid_session
        }.to change(Disclaimer, :count).by(1)
      end

      it "assigns a newly created disclaimer as @disclaimer" do
        post :create, {:disclaimer => valid_attributes}, valid_session
        assigns(:disclaimer).should be_a(Disclaimer)
        assigns(:disclaimer).should be_persisted
      end

      it "redirects to the created disclaimer" do
        post :create, {:disclaimer => valid_attributes}, valid_session
        response.should redirect_to(Disclaimer.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved disclaimer as @disclaimer" do
        # Trigger the behavior that occurs when invalid params are submitted
        Disclaimer.any_instance.stub(:save).and_return(false)
        post :create, {:disclaimer => { "name" => "invalid value" }}, valid_session
        assigns(:disclaimer).should be_a_new(Disclaimer)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Disclaimer.any_instance.stub(:save).and_return(false)
        post :create, {:disclaimer => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested disclaimer" do
        disclaimer = Disclaimer.create! valid_attributes
        # Assuming there are no other disclaimers in the database, this
        # specifies that the Disclaimer created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Disclaimer.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => disclaimer.to_param, :disclaimer => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested disclaimer as @disclaimer" do
        disclaimer = Disclaimer.create! valid_attributes
        put :update, {:id => disclaimer.to_param, :disclaimer => valid_attributes}, valid_session
        assigns(:disclaimer).should eq(disclaimer)
      end

      it "redirects to the disclaimer" do
        disclaimer = Disclaimer.create! valid_attributes
        put :update, {:id => disclaimer.to_param, :disclaimer => valid_attributes}, valid_session
        response.should redirect_to(disclaimer)
      end
    end

    describe "with invalid params" do
      it "assigns the disclaimer as @disclaimer" do
        disclaimer = Disclaimer.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Disclaimer.any_instance.stub(:save).and_return(false)
        put :update, {:id => disclaimer.to_param, :disclaimer => { "name" => "invalid value" }}, valid_session
        assigns(:disclaimer).should eq(disclaimer)
      end

      it "re-renders the 'edit' template" do
        disclaimer = Disclaimer.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Disclaimer.any_instance.stub(:save).and_return(false)
        put :update, {:id => disclaimer.to_param, :disclaimer => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested disclaimer" do
      disclaimer = Disclaimer.create! valid_attributes
      expect {
        delete :destroy, {:id => disclaimer.to_param}, valid_session
      }.to change(Disclaimer, :count).by(-1)
    end

    it "redirects to the disclaimers list" do
      disclaimer = Disclaimer.create! valid_attributes
      delete :destroy, {:id => disclaimer.to_param}, valid_session
      response.should redirect_to(disclaimers_url)
    end
  end

end
