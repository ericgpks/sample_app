# frozen_string_literal: true
require 'rails_helper'

RSpec.describe StaticPagesController do
  let(:base_title) { 'Ruby on Rails Tutorial Sample App' }

  describe 'Static pages' do
    it 'should get root' do
      get root_url
      assert_response :success
    end

    it 'should get home' do
      get static_pages_home_url
      assert_response :success
      assert_select 'title', "Home | #{base_title}"
    end

    it 'should get help' do
      get static_pages_help_url
      assert_response :success
      assert_select 'title', "Help | #{base_title}"
    end

    it 'should get about' do
      get static_pages_about_url
      assert_response :success
      assert_select 'title', "About | #{base_title}"
    end

    it 'should get contact' do
      get static_pages_contact_url
      assert_response :success
      assert_select 'title', "Contact | #{base_title}"
    end
  end
end
