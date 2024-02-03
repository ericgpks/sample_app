require 'rails_helper'

RSpec.describe SessionsController do
  describe 'new' do
    it 'should get new' do
      get login_path
      assert_response :success
    end
  end
end
