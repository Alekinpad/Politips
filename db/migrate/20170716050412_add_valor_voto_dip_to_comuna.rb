class AddValorVotoDipToComuna < ActiveRecord::Migration[5.0]
  def change
    add_column :comunas, :valor_voto_dip, :float
  end
end
