require 'rails_helper'

RSpec.describe UsersController do
  describe 'new' do
    it 'should get new' do
      get signup_path
      assert_response :success
    end
  end
end
