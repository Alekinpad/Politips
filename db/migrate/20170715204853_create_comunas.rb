class CreateComunas < ActiveRecord::Migration[5.0]
  def change
    create_table :comunas do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
