class AddCircunscripcionsRefToSenadors < ActiveRecord::Migration[5.0]
  def change
    add_reference :senadors, :circunscripcions, foreign_key: true
  end
end
