require 'rails_helper'

RSpec.describe WelcomeController, :type => :controller do

  describe "GET #index" do
    it "should render the index view without a user" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "check if page redirects occur" do

    before :each do
      @user = FactoryGirl.build(:user)
    end

    it "should render the dashboard view with the angular template" do
      sign_in @user
      get :dashboard
      expect(response).to render_template :dashboard
      expect(response).to render_template layout: "layouts/angular"
    end

    it "should redirect from dashboard view to index without a user" do
      get :dashboard
      expect(response).to render_template :index
    end
  end
end
