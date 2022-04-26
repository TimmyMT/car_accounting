# frozen_string_literal: true

FactoryBot.define do
  factory :car do
    user
    number { 'а123бв02' }
    manufacturer { 'Volkswagen' }
    model { %w[golf jetta passat].sample }
  end
end
