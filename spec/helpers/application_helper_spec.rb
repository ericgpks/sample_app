require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe 'full_title' do
    it 'should return correct full_title' do
      assert_equal 'Ruby on Rails Tutorial Sample App', full_title
      assert_equal 'Help | Ruby on Rails Tutorial Sample App', full_title('Help')
    end
  end
end
