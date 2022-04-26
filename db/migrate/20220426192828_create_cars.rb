# frozen_string_literal: true

class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.string :number, null: false
      t.string :manufacturer, null: false
      t.string :model, null: false

      t.timestamps
    end
  end
end
