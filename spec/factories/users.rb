# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { '123456' }
    role { 'manager' }

    trait :admin do
      role { 'admin' }
    end
  end
end
