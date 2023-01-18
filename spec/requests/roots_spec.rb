require 'rails_helper'

RSpec.describe "Root", type: :request do
  describe "GET /root" do
    before(:each) do
      login_user
    end

    it "works! (now write some real specs)" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end
end
