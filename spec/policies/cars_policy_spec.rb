# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CarsPolicy, type: :policy do
  let(:user) { create :user, :admin }

  subject { described_class.new(user, nil) }

  context 'when user is admin' do
    it { is_expected.to permit_actions(%i[index create manager_cars]) }
  end

  context 'when user is manager' do
    let(:user) { create :user }

    it { is_expected.to forbid_actions(%i[index manager_cars]) }
    it { is_expected.to permit_actions(%i[create]) }
  end
end
