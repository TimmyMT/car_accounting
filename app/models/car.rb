class Car < ApplicationRecord
  NUMBER_REGULAR = /^[а-яё\-\s]{1}[0-9]{3}(?<!0{3})[а-яё\-\s]{2}[0-9]{2}$/

  belongs_to :user

  validates :number, :manufacturer, :model, presence: true
  validates :number, uniqueness: true
  validates :number, format: { with: NUMBER_REGULAR, message: "Гос номер автомобиля", multiline: true }
end
