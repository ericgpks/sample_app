require 'rails_helper'

RSpec.describe 'Link' do
  describe 'layout links' do
    it 'should get links' do
      get root_path
      expect(response).to render_template('static_pages/home')
      assert_select "a[href=?]", root_path, count: 2
      assert_select "a[href=?]", help_path
      assert_select "a[href=?]", about_path
      assert_select "a[href=?]", contact_path

      get contact_path
      assert_select "title", full_title("Contact")

      get signup_path
      assert_select "title", full_title("Sign up")
    end
  end
end
