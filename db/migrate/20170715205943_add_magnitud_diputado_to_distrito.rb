class AddMagnitudDiputadoToDistrito < ActiveRecord::Migration[5.0]
  def change
    add_column :distritos, :magnitud_diputado, :integer
  end
end
