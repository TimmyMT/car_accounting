# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:cars).dependent(:destroy) }

  context 'roles' do
    let(:user_admin_role) { build :user, :admin }
    let(:user_manager_role) { build :user }
    let(:user_invalid_role) { build :user, role: 'invalid role' }

    it 'return valid role admin' do
      expect(user_admin_role.valid?).to eq true
    end

    it 'return valid role manager' do
      expect(user_manager_role.valid?).to eq true
    end

    it 'return invalud value' do
      expect(user_invalid_role.valid?).to eq false
    end
  end
end
