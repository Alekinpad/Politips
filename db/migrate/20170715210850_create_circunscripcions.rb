class CreateCircunscripcions < ActiveRecord::Migration[5.0]
  def change
    create_table :circunscripcions do |t|
      t.string :circ
      t.string :region
      t.integer :magnitud_senador

      t.timestamps
    end
  end
end
