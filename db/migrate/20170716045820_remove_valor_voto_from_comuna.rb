class RemoveValorVotoFromComuna < ActiveRecord::Migration[5.0]
  def change
    remove_column :comunas, :valor_voto, :float
  end
end
