# frozen_string_literal: true

class Car < ApplicationRecord
  NUMBER_REGULAR = /^[а-яё\-\s]{1}[0-9]{3}(?<!0{3})[а-яё\-\s]{2}[0-9]{2}$/.freeze

  belongs_to :user

  validates :number, :manufacturer, :model, presence: true
  validates :number, format: { with: NUMBER_REGULAR, message: 'Number is wrong', multiline: true }

  scope :by_number, ->(number) { where(number: number) }
  scope :by_manufacturer, ->(manufacturer) { where(manufacturer: manufacturer) }
  scope :by_model, ->(model) { where(model: model) }
end
