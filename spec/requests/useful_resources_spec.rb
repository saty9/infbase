require 'rails_helper'

RSpec.describe "UsefulResources", type: :request do
  describe "GET /useful_resources" do
    it "works! (now write some real specs)" do
      get useful_resources_path
      expect(response).to have_http_status(200)
    end
  end
end
