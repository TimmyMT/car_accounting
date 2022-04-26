# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CarsController, type: :controller do
  describe 'POST #create' do
    context 'authorized user' do
      before { login(user) }

      context 'manager session' do
        let(:user) { create :user }

        it 'created new record' do
          expect do
            post :create, params: { car: attributes_for(:car) }
          end.to change(Car, :count).by(1)
        end
      end

      context 'admin session' do
        let(:user) { create :user, :admin }

        it 'created new record' do
          expect do
            post :create, params: { car: attributes_for(:car) }
          end.to change(Car, :count).by(1)
        end
      end
    end

    context 'guest session' do
      it 'created new record' do
        expect do
          post :create, params: { car: attributes_for(:car) }
        end.not_to change(Car, :count)
      end
    end
  end
end
