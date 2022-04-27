# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Car, type: :model do
  it { should belong_to(:user) }

  it { should validate_presence_of(:number) }
  it { should validate_presence_of(:manufacturer) }
  it { should validate_presence_of(:model) }

  it { is_expected.to allow_value("а123бв02").for(:number) }
  it { is_expected.to_not allow_value("a123bc02").for(:number) }

  context 'scopes' do
    let!(:car_with_number) { create :car, number: 'а321бв02' }
    let!(:car_with_manufacturer) { create :car, manufacturer: 'BMW' }
    let!(:car_with_model) { create :car, model: 'x1' }

    it 'return cars by number' do
      expect(Car.by_number('а321бв02')).to eq [car_with_number]
    end

    it 'return cars by manufacturer' do
      expect(Car.by_manufacturer('BMW')).to eq [car_with_manufacturer]
    end

    it 'return cars by model' do
      expect(Car.by_model('x1')).to eq [car_with_model]
    end
  end
end
