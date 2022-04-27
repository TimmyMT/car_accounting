# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    context 'authorized user' do
      before do
        login(user)
        get :index
      end

      context 'manager session' do
        let(:user) { create :user }

        it 'friendly redirect to root path' do
          expect(response).to redirect_to root_path
        end
      end

      context 'admin session' do
        let(:user) { create :user, :admin }

        it 'render template index' do
          expect(response).to render_template(:index)
        end
      end
    end

    context 'guest session' do
      it 'friendly redirect to login path' do
        get :index
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end