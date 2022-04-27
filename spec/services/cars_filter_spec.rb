# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CarsFilter do
  subject { described_class.new(relation, params) }

  let(:relation) { Car.all }

  let!(:car_with_number) { create :car, number: 'а321бв02' }
  let!(:car_with_manufacturer) { create :car, manufacturer: 'BMW' }
  let!(:car_with_model) { create :car, model: 'x1' }

  context 'when param number is present' do
    let(:params) { { number: 'а321бв02' } }

    it 'return cars by number' do
      expect(subject.call).to eq [car_with_number]
    end
  end

  context 'when param manufacturer is present' do
    let(:params) { { manufacturer: 'BMW' } }

    it 'return cars by manufacturer' do
      expect(subject.call).to eq [car_with_manufacturer]
    end
  end

  context 'when param model is present' do
    let(:params) { { model: 'x1' } }

    it 'return cars by model' do
      expect(subject.call).to eq [car_with_model]
    end
  end

  context 'when all params is present' do
    let(:car_with_all_params) { create :car, number: 'а321бв02', manufacturer: 'BMW', model: 'x1' }
    let(:params) { { number: 'а321бв02', manufacturer: 'BMW', model: 'x1' } }

    it 'return cars with params' do
      expect(subject.call).to eq [car_with_all_params]
    end
  end
end