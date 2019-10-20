require "rails_helper"

RSpec.describe UsefulResourcesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/useful_resources").to route_to("useful_resources#index")
    end

    it "routes to #show" do
      expect(:get => "/useful_resources/1").to route_to("useful_resources#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/useful_resources").to route_to("useful_resources#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/useful_resources/1").to route_to("useful_resources#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/useful_resources/1").to route_to("useful_resources#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/useful_resources/1").to route_to("useful_resources#destroy", :id => "1")
    end
  end
end
