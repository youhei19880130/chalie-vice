require 'rails_helper'

RSpec.describe "ChalieVice::Items", type: :request do
  describe "GET /chalie_vice_items" do
    it "works! (now write some real specs)" do
      get chalie_vice_items_path
      expect(response).to have_http_status(200)
    end
  end
end
