class CreateDiputados < ActiveRecord::Migration[5.0]
  def change
    create_table :diputados do |t|
      t.string :candidato
      t.string :partido
      t.string :pacto

      t.timestamps
    end
  end
end
