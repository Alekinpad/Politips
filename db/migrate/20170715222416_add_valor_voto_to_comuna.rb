class AddValorVotoToComuna < ActiveRecord::Migration[5.0]
  def change
    add_column :comunas, :valor_voto, :float
  end
end
