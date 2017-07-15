class CreateDistritos < ActiveRecord::Migration[5.0]
  def change
    create_table :distritos do |t|
      t.integer :numero_distrito

      t.timestamps
    end
  end
end
