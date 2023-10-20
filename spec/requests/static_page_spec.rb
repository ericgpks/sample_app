# frozen_string_literal: true
require 'rails_helper'

RSpec.describe StaticPagesController do
  describe 'Static pages' do
    it 'should get home' do
      get static_pages_home_url
      assert_response :success
    end

    it 'should get help' do
      get static_pages_help_url
      assert_response :success
    end

    it 'should get about' do
      get static_pages_about_url
      assert_response :success
    end
  end
end
