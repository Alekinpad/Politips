class CreateSenadors < ActiveRecord::Migration[5.0]
  def change
    create_table :senadors do |t|
      t.string :candidato
      t.string :partido
      t.string :pacto

      t.timestamps
    end
  end
end
