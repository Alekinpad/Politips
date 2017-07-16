class AddValorVotoSenToComuna < ActiveRecord::Migration[5.0]
  def change
    add_column :comunas, :valor_voto_sen, :float
  end
end
