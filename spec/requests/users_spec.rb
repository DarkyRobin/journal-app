require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new user" do
        post "/users", params: { user: { username: "example_user", email: "user@example.com", password: "password" } }
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid parameters" do
      it "does not create a new user" do
        post "/users", params: { user: { username: nil, email: "user@example.com", password: "password" } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
