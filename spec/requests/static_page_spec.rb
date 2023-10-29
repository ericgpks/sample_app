# frozen_string_literal: true
require 'rails_helper'

RSpec.describe StaticPagesController do
  let(:base_title) { 'Ruby on Rails Tutorial Sample App' }

  describe 'Static pages' do
    it 'should get root' do
      get root_path
      assert_response :success
    end

    it 'should get home' do
      get root_path
      assert_response :success
      assert_select 'title', "Home | #{base_title}"
    end

    it 'should get help' do
      get help_path
      assert_response :success
      assert_select 'title', "Help | #{base_title}"
    end

    it 'should get about' do
      get about_path
      assert_response :success
      assert_select 'title', "About | #{base_title}"
    end

    it 'should get contact' do
      get contact_path
      assert_response :success
      assert_select 'title', "Contact | #{base_title}"
    end
  end
end
