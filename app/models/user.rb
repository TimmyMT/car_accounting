# frozen_string_literal: true

class User < ApplicationRecord
  ROLES = %i[admin manager].freeze

  has_many :cars, dependent: :destroy

  devise :database_authenticatable, :registerable, :validatable

  extend Enumerize

  enumerize :role, in: ROLES, predicates: true
end
