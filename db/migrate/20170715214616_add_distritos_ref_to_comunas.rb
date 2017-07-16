class AddDistritosRefToComunas < ActiveRecord::Migration[5.0]
  def change
    add_reference :comunas, :distrito, foreign_key: true
  end
end
