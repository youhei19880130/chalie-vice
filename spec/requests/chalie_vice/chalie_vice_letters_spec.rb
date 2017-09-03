require 'rails_helper'

RSpec.describe "ChalieVice::Letters", type: :request do
  describe "GET /chalie_vice_letters" do
    it "works! (now write some real specs)" do
      get chalie_vice_letters_path
      expect(response).to have_http_status(200)
    end
  end
end
