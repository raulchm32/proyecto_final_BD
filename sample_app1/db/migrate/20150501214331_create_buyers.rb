class CreateBuyers < ActiveRecord::Migration
  def change
    create_table :buyers do |t|
      t.string :Nombre
      t.string :Direccion
      t.integer :Telefono

      t.timestamps null: false
    end
  end
end
