class AddDistritosRefToDiputados < ActiveRecord::Migration[5.0]
  def change
    add_reference :diputados, :distrito, foreign_key: true
  end
end
