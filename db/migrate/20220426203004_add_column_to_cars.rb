class AddColumnToCars < ActiveRecord::Migration[6.0]
  def change
    add_column :cars, :record_count, :integer, default: 1, null: false
  end
end
