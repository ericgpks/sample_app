require 'rails_helper'

RSpec.describe 'users signup' do
  describe "invalid signup information" do
    it "should not create a user" do
      get signup_path
      expect {
        post users_path, params: { user: { name: "",
                                           email: "user@invalid",
                                           password: "foo",
                                           password_confirmation: "bar" } }
      }.to_not change(User, :count)
      assert_response :unprocessable_entity
      assert_template 'users/new'
    end
  end

  describe "valid signup information" do
    it "should create a user" do
      get signup_path
      expect {
        post users_path, params: { user: { name: "Example User",
                                           email: "user@example.com",
                                           password: "password",
                                           password_confirmation: "password" }}
      }.to change(User, :count).by(1)
      follow_redirect!
      assert_template 'users/show'
    end
  end
end
