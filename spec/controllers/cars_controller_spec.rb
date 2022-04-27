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

        context 'when record already exist' do
          let!(:exist_car) { create :car, user: user }
          let(:params) do
            { 
              car: { 
                number: exist_car.number, 
                manufacturer: exist_car.manufacturer, 
                model: exist_car.model 
              }
            }
          end

          it 'not created new car' do
            expect do
              post :create, params: params
            end.not_to change(Car, :count)
          end
          
          it 'updated exist car' do
            post :create, params: params
            expect(exist_car.reload.record_count).to eq 2
          end
        end

        context 'when record has invalid params' do
          let(:params) do
            { 
              car: { 
                number: 'a123bc02', 
                manufacturer: 'BMW', 
                model: 'x1' 
              }
            }
          end

          it 'not created new car' do
            expect do
              post :create, params: params
            end.not_to change(Car, :count)
          end

          it 'render template new with errors' do
            post :create, params: params
            expect(response).to render_template(:new)
          end
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

  describe 'GET #new' do
    context 'authorized user' do
      before do
        login(user)
        get :new
      end

      context 'manager session' do
        let(:user) { create :user }

        it 'render template new' do
          expect(response).to render_template(:new)
        end
      end

      context 'admin session' do
        let(:user) { create :user, :admin }

        it 'render template new' do
          expect(response).to render_template(:new)
        end
      end
    end

    context 'guest session' do
      it 'friendly redirect to login path' do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'GET #manager_cars' do
    let(:manager) { create :user }

    context 'authorized user' do
      before do
        login(user)
        get :manager_cars, params: { user_id: manager.id }
      end

      context 'manager session' do
        let(:user) { create :user }

        it 'friendly redirect to root path' do
          expect(response).to redirect_to root_path
        end
      end

      context 'admin session' do
        let(:user) { create :user, :admin }

        it 'render template manager_cars' do
          expect(response).to render_template(:manager_cars)
        end
      end
    end

    context 'guest session' do
      it 'friendly redirect to login path' do
        get :manager_cars, params: { user_id: manager.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
