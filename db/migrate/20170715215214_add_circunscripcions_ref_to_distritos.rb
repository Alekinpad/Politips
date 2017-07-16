class AddCircunscripcionsRefToDistritos < ActiveRecord::Migration[5.0]
  def change
    add_reference :distritos, :circunscripcion, foreign_key: true
  end
end
