class AddCircunscripcionsRefToDistritos < ActiveRecord::Migration[5.0]
  def change
    add_reference :distritos, :circunscripcions, foreign_key: true
  end
end
