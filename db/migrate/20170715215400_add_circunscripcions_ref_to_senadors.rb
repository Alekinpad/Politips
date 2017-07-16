class AddCircunscripcionsRefToSenadors < ActiveRecord::Migration[5.0]
  def change
    add_reference :senadors, :circunscripcion, foreign_key: true
  end
end
