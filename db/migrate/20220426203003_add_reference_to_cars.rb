class AddReferenceToCars < ActiveRecord::Migration[6.0]
  def change
    add_reference :cars, :user, index: true
  end
end
